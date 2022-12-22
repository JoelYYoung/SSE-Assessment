; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !19, metadata !DIExpression()), !dbg !21
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !22, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !34
  %1 = load i8*, i8** %0, align 8, !dbg !35
  store i8* %1, i8** %data1, align 8, !dbg !33
  %2 = load i8*, i8** %data1, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !37
  %3 = load i8*, i8** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !40
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %4, i8** %5, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %7 = load i8*, i8** %6, align 8, !dbg !47
  store i8* %7, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !53
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !54
  %9 = load i8*, i8** %data2, align 8, !dbg !55
  %call = call i64 @strlen(i8* %9) #6, !dbg !56
  %10 = load i8*, i8** %data2, align 8, !dbg !57
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay3, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %10) #7, !dbg !58
  %11 = load i8*, i8** %data2, align 8, !dbg !59
  call void @printLine(i8* %11), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #7, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #7, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i8* %arraydecay, i8** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !97
  %1 = load i8*, i8** %0, align 8, !dbg !98
  store i8* %1, i8** %data1, align 8, !dbg !96
  %2 = load i8*, i8** %data1, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !100
  %3 = load i8*, i8** %data1, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %4 = load i8*, i8** %data1, align 8, !dbg !103
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !104
  store i8* %4, i8** %5, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !106, metadata !DIExpression()), !dbg !108
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !109
  %7 = load i8*, i8** %6, align 8, !dbg !110
  store i8* %7, i8** %data2, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !113
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !114
  %9 = load i8*, i8** %data2, align 8, !dbg !115
  %call = call i64 @strlen(i8* %9) #6, !dbg !116
  %10 = load i8*, i8** %data2, align 8, !dbg !117
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay3, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %10) #7, !dbg !118
  %11 = load i8*, i8** %data2, align 8, !dbg !119
  call void @printLine(i8* %11), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!21 = !DILocation(line: 32, column: 13, scope: !11)
!22 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 33, type: !20)
!23 = !DILocation(line: 33, column: 13, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 34, column: 10, scope: !11)
!29 = !DILocation(line: 35, column: 12, scope: !11)
!30 = !DILocation(line: 35, column: 10, scope: !11)
!31 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 37, type: !16)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!33 = !DILocation(line: 37, column: 16, scope: !32)
!34 = !DILocation(line: 37, column: 24, scope: !32)
!35 = !DILocation(line: 37, column: 23, scope: !32)
!36 = !DILocation(line: 39, column: 16, scope: !32)
!37 = !DILocation(line: 39, column: 9, scope: !32)
!38 = !DILocation(line: 40, column: 9, scope: !32)
!39 = !DILocation(line: 40, column: 21, scope: !32)
!40 = !DILocation(line: 41, column: 21, scope: !32)
!41 = !DILocation(line: 41, column: 10, scope: !32)
!42 = !DILocation(line: 41, column: 19, scope: !32)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 44, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!45 = !DILocation(line: 44, column: 16, scope: !44)
!46 = !DILocation(line: 44, column: 24, scope: !44)
!47 = !DILocation(line: 44, column: 23, scope: !44)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 46, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !12, line: 45, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 50)
!53 = !DILocation(line: 46, column: 18, scope: !49)
!54 = !DILocation(line: 48, column: 22, scope: !49)
!55 = !DILocation(line: 48, column: 35, scope: !49)
!56 = !DILocation(line: 48, column: 28, scope: !49)
!57 = !DILocation(line: 48, column: 48, scope: !49)
!58 = !DILocation(line: 48, column: 13, scope: !49)
!59 = !DILocation(line: 49, column: 23, scope: !49)
!60 = !DILocation(line: 49, column: 13, scope: !49)
!61 = !DILocation(line: 52, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_32_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 86, column: 5, scope: !62)
!64 = !DILocation(line: 87, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !66, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !20}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 98, type: !68)
!70 = !DILocation(line: 98, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 98, type: !20)
!72 = !DILocation(line: 98, column: 27, scope: !65)
!73 = !DILocation(line: 101, column: 22, scope: !65)
!74 = !DILocation(line: 101, column: 12, scope: !65)
!75 = !DILocation(line: 101, column: 5, scope: !65)
!76 = !DILocation(line: 103, column: 5, scope: !65)
!77 = !DILocation(line: 104, column: 5, scope: !65)
!78 = !DILocation(line: 105, column: 5, scope: !65)
!79 = !DILocation(line: 108, column: 5, scope: !65)
!80 = !DILocation(line: 109, column: 5, scope: !65)
!81 = !DILocation(line: 110, column: 5, scope: !65)
!82 = !DILocation(line: 112, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 61, type: !16)
!85 = !DILocation(line: 61, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataPtr1", scope: !83, file: !12, line: 62, type: !20)
!87 = !DILocation(line: 62, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataPtr2", scope: !83, file: !12, line: 63, type: !20)
!89 = !DILocation(line: 63, column: 13, scope: !83)
!90 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !12, line: 64, type: !25)
!91 = !DILocation(line: 64, column: 10, scope: !83)
!92 = !DILocation(line: 65, column: 12, scope: !83)
!93 = !DILocation(line: 65, column: 10, scope: !83)
!94 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 67, type: !16)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 66, column: 5)
!96 = !DILocation(line: 67, column: 16, scope: !95)
!97 = !DILocation(line: 67, column: 24, scope: !95)
!98 = !DILocation(line: 67, column: 23, scope: !95)
!99 = !DILocation(line: 69, column: 16, scope: !95)
!100 = !DILocation(line: 69, column: 9, scope: !95)
!101 = !DILocation(line: 70, column: 9, scope: !95)
!102 = !DILocation(line: 70, column: 20, scope: !95)
!103 = !DILocation(line: 71, column: 21, scope: !95)
!104 = !DILocation(line: 71, column: 10, scope: !95)
!105 = !DILocation(line: 71, column: 19, scope: !95)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 74, type: !16)
!107 = distinct !DILexicalBlock(scope: !83, file: !12, line: 73, column: 5)
!108 = !DILocation(line: 74, column: 16, scope: !107)
!109 = !DILocation(line: 74, column: 24, scope: !107)
!110 = !DILocation(line: 74, column: 23, scope: !107)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 76, type: !50)
!112 = distinct !DILexicalBlock(scope: !107, file: !12, line: 75, column: 9)
!113 = !DILocation(line: 76, column: 18, scope: !112)
!114 = !DILocation(line: 78, column: 22, scope: !112)
!115 = !DILocation(line: 78, column: 35, scope: !112)
!116 = !DILocation(line: 78, column: 28, scope: !112)
!117 = !DILocation(line: 78, column: 48, scope: !112)
!118 = !DILocation(line: 78, column: 13, scope: !112)
!119 = !DILocation(line: 79, column: 23, scope: !112)
!120 = !DILocation(line: 79, column: 13, scope: !112)
!121 = !DILocation(line: 82, column: 1, scope: !83)
