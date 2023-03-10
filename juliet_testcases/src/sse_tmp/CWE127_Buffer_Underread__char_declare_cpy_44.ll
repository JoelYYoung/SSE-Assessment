; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  call void %0(i8* %1), !dbg !35
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !47
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !50
  %0 = load i8*, i8** %data.addr, align 8, !dbg !51
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %0) #5, !dbg !52
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay2), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_44_good() #0 !dbg !56 {
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
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__char_declare_cpy_44_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_declare_cpy_44_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !81, metadata !DIExpression()), !dbg !82
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !85
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay1, i8** %data, align 8, !dbg !89
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !90
  %1 = load i8*, i8** %data, align 8, !dbg !91
  call void %0(i8* %1), !dbg !90
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !93 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !99
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !102
  %0 = load i8*, i8** %data.addr, align 8, !dbg !103
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %0) #5, !dbg !104
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !105
  call void @printLine(i8* %arraydecay2), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_44_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 37, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 39, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 39, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 40, column: 10, scope: !11)
!29 = !DILocation(line: 41, column: 5, scope: !11)
!30 = !DILocation(line: 42, column: 5, scope: !11)
!31 = !DILocation(line: 42, column: 23, scope: !11)
!32 = !DILocation(line: 44, column: 12, scope: !11)
!33 = !DILocation(line: 44, column: 23, scope: !11)
!34 = !DILocation(line: 44, column: 10, scope: !11)
!35 = !DILocation(line: 46, column: 5, scope: !11)
!36 = !DILocation(line: 46, column: 13, scope: !11)
!37 = !DILocation(line: 47, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !12, line: 23, type: !16)
!40 = !DILocation(line: 23, column: 28, scope: !38)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 26, type: !43)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 25, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 200)
!46 = !DILocation(line: 26, column: 14, scope: !42)
!47 = !DILocation(line: 27, column: 9, scope: !42)
!48 = !DILocation(line: 28, column: 9, scope: !42)
!49 = !DILocation(line: 28, column: 23, scope: !42)
!50 = !DILocation(line: 30, column: 16, scope: !42)
!51 = !DILocation(line: 30, column: 22, scope: !42)
!52 = !DILocation(line: 30, column: 9, scope: !42)
!53 = !DILocation(line: 31, column: 19, scope: !42)
!54 = !DILocation(line: 31, column: 9, scope: !42)
!55 = !DILocation(line: 33, column: 1, scope: !38)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_44_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 80, column: 5, scope: !56)
!58 = !DILocation(line: 81, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !60, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 92, type: !62)
!65 = !DILocation(line: 92, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 92, type: !63)
!67 = !DILocation(line: 92, column: 27, scope: !59)
!68 = !DILocation(line: 95, column: 22, scope: !59)
!69 = !DILocation(line: 95, column: 12, scope: !59)
!70 = !DILocation(line: 95, column: 5, scope: !59)
!71 = !DILocation(line: 97, column: 5, scope: !59)
!72 = !DILocation(line: 98, column: 5, scope: !59)
!73 = !DILocation(line: 99, column: 5, scope: !59)
!74 = !DILocation(line: 102, column: 5, scope: !59)
!75 = !DILocation(line: 103, column: 5, scope: !59)
!76 = !DILocation(line: 104, column: 5, scope: !59)
!77 = !DILocation(line: 106, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 68, type: !16)
!80 = !DILocation(line: 68, column: 12, scope: !78)
!81 = !DILocalVariable(name: "funcPtr", scope: !78, file: !12, line: 69, type: !20)
!82 = !DILocation(line: 69, column: 12, scope: !78)
!83 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !12, line: 70, type: !25)
!84 = !DILocation(line: 70, column: 10, scope: !78)
!85 = !DILocation(line: 71, column: 5, scope: !78)
!86 = !DILocation(line: 72, column: 5, scope: !78)
!87 = !DILocation(line: 72, column: 23, scope: !78)
!88 = !DILocation(line: 74, column: 12, scope: !78)
!89 = !DILocation(line: 74, column: 10, scope: !78)
!90 = !DILocation(line: 75, column: 5, scope: !78)
!91 = !DILocation(line: 75, column: 13, scope: !78)
!92 = !DILocation(line: 76, column: 1, scope: !78)
!93 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 54, type: !21, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", arg: 1, scope: !93, file: !12, line: 54, type: !16)
!95 = !DILocation(line: 54, column: 32, scope: !93)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !12, line: 57, type: !43)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 56, column: 5)
!98 = !DILocation(line: 57, column: 14, scope: !97)
!99 = !DILocation(line: 58, column: 9, scope: !97)
!100 = !DILocation(line: 59, column: 9, scope: !97)
!101 = !DILocation(line: 59, column: 23, scope: !97)
!102 = !DILocation(line: 61, column: 16, scope: !97)
!103 = !DILocation(line: 61, column: 22, scope: !97)
!104 = !DILocation(line: 61, column: 9, scope: !97)
!105 = !DILocation(line: 62, column: 19, scope: !97)
!106 = !DILocation(line: 62, column: 9, scope: !97)
!107 = !DILocation(line: 64, column: 1, scope: !93)
