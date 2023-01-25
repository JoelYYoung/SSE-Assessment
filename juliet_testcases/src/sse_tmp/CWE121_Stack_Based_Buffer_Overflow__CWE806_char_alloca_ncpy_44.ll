; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_bad() #0 !dbg !13 {
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
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !33
  %5 = load i8*, i8** %data, align 8, !dbg !34
  call void %4(i8* %5), !dbg !33
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !46
  %2 = load i8*, i8** %data.addr, align 8, !dbg !47
  %call = call i64 @strlen(i8* %2) #6, !dbg !48
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %1, i64 %call) #7, !dbg !49
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !51
  %3 = load i8*, i8** %data.addr, align 8, !dbg !52
  call void @printLine(i8* %3), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !81
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 100, align 16, !dbg !84
  store i8* %0, i8** %dataBuffer, align 8, !dbg !83
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %1, i8** %data, align 8, !dbg !86
  %2 = load i8*, i8** %data, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !88
  %3 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !92
  call void %4(i8* %5), !dbg !91
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !94 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !100
  %1 = load i8*, i8** %data.addr, align 8, !dbg !101
  %2 = load i8*, i8** %data.addr, align 8, !dbg !102
  %call = call i64 @strlen(i8* %2) #6, !dbg !103
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %1, i64 %call) #7, !dbg !104
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %3 = load i8*, i8** %data.addr, align 8, !dbg !107
  call void @printLine(i8* %3), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_bad", scope: !14, file: !14, line: 34, type: !15, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 36, type: !4)
!18 = !DILocation(line: 36, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 38, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 38, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 39, type: !4)
!25 = !DILocation(line: 39, column: 12, scope: !13)
!26 = !DILocation(line: 39, column: 33, scope: !13)
!27 = !DILocation(line: 40, column: 12, scope: !13)
!28 = !DILocation(line: 40, column: 10, scope: !13)
!29 = !DILocation(line: 42, column: 12, scope: !13)
!30 = !DILocation(line: 42, column: 5, scope: !13)
!31 = !DILocation(line: 43, column: 5, scope: !13)
!32 = !DILocation(line: 43, column: 17, scope: !13)
!33 = !DILocation(line: 45, column: 5, scope: !13)
!34 = !DILocation(line: 45, column: 13, scope: !13)
!35 = !DILocation(line: 46, column: 1, scope: !13)
!36 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !14, line: 23, type: !4)
!38 = !DILocation(line: 23, column: 28, scope: !36)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !14, line: 26, type: !41)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 25, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 26, column: 14, scope: !40)
!45 = !DILocation(line: 28, column: 17, scope: !40)
!46 = !DILocation(line: 28, column: 23, scope: !40)
!47 = !DILocation(line: 28, column: 36, scope: !40)
!48 = !DILocation(line: 28, column: 29, scope: !40)
!49 = !DILocation(line: 28, column: 9, scope: !40)
!50 = !DILocation(line: 29, column: 9, scope: !40)
!51 = !DILocation(line: 29, column: 20, scope: !40)
!52 = !DILocation(line: 30, column: 19, scope: !40)
!53 = !DILocation(line: 30, column: 9, scope: !40)
!54 = !DILocation(line: 32, column: 1, scope: !36)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 78, column: 5, scope: !55)
!57 = !DILocation(line: 79, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 90, type: !59, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !14, line: 90, type: !61)
!64 = !DILocation(line: 90, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !14, line: 90, type: !62)
!66 = !DILocation(line: 90, column: 27, scope: !58)
!67 = !DILocation(line: 93, column: 22, scope: !58)
!68 = !DILocation(line: 93, column: 12, scope: !58)
!69 = !DILocation(line: 93, column: 5, scope: !58)
!70 = !DILocation(line: 95, column: 5, scope: !58)
!71 = !DILocation(line: 96, column: 5, scope: !58)
!72 = !DILocation(line: 97, column: 5, scope: !58)
!73 = !DILocation(line: 100, column: 5, scope: !58)
!74 = !DILocation(line: 101, column: 5, scope: !58)
!75 = !DILocation(line: 102, column: 5, scope: !58)
!76 = !DILocation(line: 104, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 66, type: !4)
!79 = !DILocation(line: 66, column: 12, scope: !77)
!80 = !DILocalVariable(name: "funcPtr", scope: !77, file: !14, line: 67, type: !20)
!81 = !DILocation(line: 67, column: 12, scope: !77)
!82 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !14, line: 68, type: !4)
!83 = !DILocation(line: 68, column: 12, scope: !77)
!84 = !DILocation(line: 68, column: 33, scope: !77)
!85 = !DILocation(line: 69, column: 12, scope: !77)
!86 = !DILocation(line: 69, column: 10, scope: !77)
!87 = !DILocation(line: 71, column: 12, scope: !77)
!88 = !DILocation(line: 71, column: 5, scope: !77)
!89 = !DILocation(line: 72, column: 5, scope: !77)
!90 = !DILocation(line: 72, column: 16, scope: !77)
!91 = !DILocation(line: 73, column: 5, scope: !77)
!92 = !DILocation(line: 73, column: 13, scope: !77)
!93 = !DILocation(line: 74, column: 1, scope: !77)
!94 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 53, type: !21, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", arg: 1, scope: !94, file: !14, line: 53, type: !4)
!96 = !DILocation(line: 53, column: 32, scope: !94)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !14, line: 56, type: !41)
!98 = distinct !DILexicalBlock(scope: !94, file: !14, line: 55, column: 5)
!99 = !DILocation(line: 56, column: 14, scope: !98)
!100 = !DILocation(line: 58, column: 17, scope: !98)
!101 = !DILocation(line: 58, column: 23, scope: !98)
!102 = !DILocation(line: 58, column: 36, scope: !98)
!103 = !DILocation(line: 58, column: 29, scope: !98)
!104 = !DILocation(line: 58, column: 9, scope: !98)
!105 = !DILocation(line: 59, column: 9, scope: !98)
!106 = !DILocation(line: 59, column: 20, scope: !98)
!107 = !DILocation(line: 60, column: 19, scope: !98)
!108 = !DILocation(line: 60, column: 9, scope: !98)
!109 = !DILocation(line: 62, column: 1, scope: !94)
