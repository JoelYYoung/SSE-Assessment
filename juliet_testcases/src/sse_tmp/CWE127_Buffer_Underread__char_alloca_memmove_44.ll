; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !28
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void %4(i8* %5), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %0 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 100, i1 false), !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx2, align 1, !dbg !52
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay3), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_memmove_44_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__char_alloca_memmove_44_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_alloca_memmove_44_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !81, metadata !DIExpression()), !dbg !82
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 100, align 16, !dbg !85
  store i8* %0, i8** %dataBuffer, align 8, !dbg !84
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !87
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !90
  store i8* %3, i8** %data, align 8, !dbg !91
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !92
  %5 = load i8*, i8** %data, align 8, !dbg !93
  call void %4(i8* %5), !dbg !92
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  %0 = load i8*, i8** %data.addr, align 8, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 100, i1 false), !dbg !104
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx2, align 1, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @printLine(i8* %arraydecay3), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_44_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 41, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 42, type: !4)
!25 = !DILocation(line: 42, column: 12, scope: !13)
!26 = !DILocation(line: 42, column: 33, scope: !13)
!27 = !DILocation(line: 43, column: 12, scope: !13)
!28 = !DILocation(line: 43, column: 5, scope: !13)
!29 = !DILocation(line: 44, column: 5, scope: !13)
!30 = !DILocation(line: 44, column: 23, scope: !13)
!31 = !DILocation(line: 46, column: 12, scope: !13)
!32 = !DILocation(line: 46, column: 23, scope: !13)
!33 = !DILocation(line: 46, column: 10, scope: !13)
!34 = !DILocation(line: 48, column: 5, scope: !13)
!35 = !DILocation(line: 48, column: 13, scope: !13)
!36 = !DILocation(line: 49, column: 1, scope: !13)
!37 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 23, type: !4)
!39 = !DILocation(line: 23, column: 28, scope: !37)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 26, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 25, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 26, column: 14, scope: !41)
!46 = !DILocation(line: 27, column: 9, scope: !41)
!47 = !DILocation(line: 28, column: 9, scope: !41)
!48 = !DILocation(line: 28, column: 21, scope: !41)
!49 = !DILocation(line: 30, column: 9, scope: !41)
!50 = !DILocation(line: 30, column: 23, scope: !41)
!51 = !DILocation(line: 32, column: 9, scope: !41)
!52 = !DILocation(line: 32, column: 21, scope: !41)
!53 = !DILocation(line: 33, column: 19, scope: !41)
!54 = !DILocation(line: 33, column: 9, scope: !41)
!55 = !DILocation(line: 35, column: 1, scope: !37)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_memmove_44_good", scope: !14, file: !14, line: 82, type: !15, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 84, column: 5, scope: !56)
!58 = !DILocation(line: 85, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 96, type: !60, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !14, line: 96, type: !62)
!65 = !DILocation(line: 96, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !14, line: 96, type: !63)
!67 = !DILocation(line: 96, column: 27, scope: !59)
!68 = !DILocation(line: 99, column: 22, scope: !59)
!69 = !DILocation(line: 99, column: 12, scope: !59)
!70 = !DILocation(line: 99, column: 5, scope: !59)
!71 = !DILocation(line: 101, column: 5, scope: !59)
!72 = !DILocation(line: 102, column: 5, scope: !59)
!73 = !DILocation(line: 103, column: 5, scope: !59)
!74 = !DILocation(line: 106, column: 5, scope: !59)
!75 = !DILocation(line: 107, column: 5, scope: !59)
!76 = !DILocation(line: 108, column: 5, scope: !59)
!77 = !DILocation(line: 110, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 70, type: !15, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 72, type: !4)
!80 = !DILocation(line: 72, column: 12, scope: !78)
!81 = !DILocalVariable(name: "funcPtr", scope: !78, file: !14, line: 73, type: !20)
!82 = !DILocation(line: 73, column: 12, scope: !78)
!83 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !14, line: 74, type: !4)
!84 = !DILocation(line: 74, column: 12, scope: !78)
!85 = !DILocation(line: 74, column: 33, scope: !78)
!86 = !DILocation(line: 75, column: 12, scope: !78)
!87 = !DILocation(line: 75, column: 5, scope: !78)
!88 = !DILocation(line: 76, column: 5, scope: !78)
!89 = !DILocation(line: 76, column: 23, scope: !78)
!90 = !DILocation(line: 78, column: 12, scope: !78)
!91 = !DILocation(line: 78, column: 10, scope: !78)
!92 = !DILocation(line: 79, column: 5, scope: !78)
!93 = !DILocation(line: 79, column: 13, scope: !78)
!94 = !DILocation(line: 80, column: 1, scope: !78)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 56, type: !21, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !14, line: 56, type: !4)
!97 = !DILocation(line: 56, column: 32, scope: !95)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !14, line: 59, type: !42)
!99 = distinct !DILexicalBlock(scope: !95, file: !14, line: 58, column: 5)
!100 = !DILocation(line: 59, column: 14, scope: !99)
!101 = !DILocation(line: 60, column: 9, scope: !99)
!102 = !DILocation(line: 61, column: 9, scope: !99)
!103 = !DILocation(line: 61, column: 21, scope: !99)
!104 = !DILocation(line: 63, column: 9, scope: !99)
!105 = !DILocation(line: 63, column: 23, scope: !99)
!106 = !DILocation(line: 65, column: 9, scope: !99)
!107 = !DILocation(line: 65, column: 21, scope: !99)
!108 = !DILocation(line: 66, column: 19, scope: !99)
!109 = !DILocation(line: 66, column: 9, scope: !99)
!110 = !DILocation(line: 68, column: 1, scope: !95)
