; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  %call = call i8* @strcpy(i8* %arraydecay, i8* %5) #5, !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* %6), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 100, align 16, !dbg !70
  store i8* %0, i8** %dataBuffer, align 8, !dbg !69
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !71
  store i8* %1, i8** %data, align 8, !dbg !72
  %2 = load i8*, i8** %data, align 8, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !76
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !79, metadata !DIExpression()), !dbg !81
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !81
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !82
  %5 = load i8*, i8** %data, align 8, !dbg !83
  %call = call i8* @strcpy(i8* %arraydecay, i8* %5) #5, !dbg !84
  %6 = load i8*, i8** %data, align 8, !dbg !85
  call void @printLine(i8* %6), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 100, align 16, !dbg !93
  store i8* %0, i8** %dataBuffer, align 8, !dbg !92
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !94
  store i8* %1, i8** %data, align 8, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  %call = call i8* @strcpy(i8* %arraydecay, i8* %5) #5, !dbg !107
  %6 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %6), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04_bad", scope: !14, file: !14, line: 30, type: !15, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 32, type: !4)
!18 = !DILocation(line: 32, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 12, scope: !13)
!21 = !DILocation(line: 33, column: 33, scope: !13)
!22 = !DILocation(line: 34, column: 12, scope: !13)
!23 = !DILocation(line: 34, column: 10, scope: !13)
!24 = !DILocation(line: 38, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !14, line: 36, column: 5)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 8)
!27 = !DILocation(line: 38, column: 9, scope: !25)
!28 = !DILocation(line: 39, column: 9, scope: !25)
!29 = !DILocation(line: 39, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !14, line: 42, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 42, column: 14, scope: !31)
!36 = !DILocation(line: 44, column: 16, scope: !31)
!37 = !DILocation(line: 44, column: 22, scope: !31)
!38 = !DILocation(line: 44, column: 9, scope: !31)
!39 = !DILocation(line: 45, column: 19, scope: !31)
!40 = !DILocation(line: 45, column: 9, scope: !31)
!41 = !DILocation(line: 47, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_04_good", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 100, column: 5, scope: !42)
!44 = !DILocation(line: 101, column: 5, scope: !42)
!45 = !DILocation(line: 102, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 114, type: !47, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 114, type: !49)
!52 = !DILocation(line: 114, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 114, type: !50)
!54 = !DILocation(line: 114, column: 27, scope: !46)
!55 = !DILocation(line: 117, column: 22, scope: !46)
!56 = !DILocation(line: 117, column: 12, scope: !46)
!57 = !DILocation(line: 117, column: 5, scope: !46)
!58 = !DILocation(line: 119, column: 5, scope: !46)
!59 = !DILocation(line: 120, column: 5, scope: !46)
!60 = !DILocation(line: 121, column: 5, scope: !46)
!61 = !DILocation(line: 124, column: 5, scope: !46)
!62 = !DILocation(line: 125, column: 5, scope: !46)
!63 = !DILocation(line: 126, column: 5, scope: !46)
!64 = !DILocation(line: 128, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 56, type: !4)
!67 = !DILocation(line: 56, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !14, line: 57, type: !4)
!69 = !DILocation(line: 57, column: 12, scope: !65)
!70 = !DILocation(line: 57, column: 33, scope: !65)
!71 = !DILocation(line: 58, column: 12, scope: !65)
!72 = !DILocation(line: 58, column: 10, scope: !65)
!73 = !DILocation(line: 67, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !14, line: 65, column: 5)
!75 = distinct !DILexicalBlock(scope: !65, file: !14, line: 59, column: 8)
!76 = !DILocation(line: 67, column: 9, scope: !74)
!77 = !DILocation(line: 68, column: 9, scope: !74)
!78 = !DILocation(line: 68, column: 20, scope: !74)
!79 = !DILocalVariable(name: "dest", scope: !80, file: !14, line: 71, type: !32)
!80 = distinct !DILexicalBlock(scope: !65, file: !14, line: 70, column: 5)
!81 = !DILocation(line: 71, column: 14, scope: !80)
!82 = !DILocation(line: 73, column: 16, scope: !80)
!83 = !DILocation(line: 73, column: 22, scope: !80)
!84 = !DILocation(line: 73, column: 9, scope: !80)
!85 = !DILocation(line: 74, column: 19, scope: !80)
!86 = !DILocation(line: 74, column: 9, scope: !80)
!87 = !DILocation(line: 76, column: 1, scope: !65)
!88 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !14, line: 81, type: !4)
!90 = !DILocation(line: 81, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !14, line: 82, type: !4)
!92 = !DILocation(line: 82, column: 12, scope: !88)
!93 = !DILocation(line: 82, column: 33, scope: !88)
!94 = !DILocation(line: 83, column: 12, scope: !88)
!95 = !DILocation(line: 83, column: 10, scope: !88)
!96 = !DILocation(line: 87, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !14, line: 85, column: 5)
!98 = distinct !DILexicalBlock(scope: !88, file: !14, line: 84, column: 8)
!99 = !DILocation(line: 87, column: 9, scope: !97)
!100 = !DILocation(line: 88, column: 9, scope: !97)
!101 = !DILocation(line: 88, column: 20, scope: !97)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !14, line: 91, type: !32)
!103 = distinct !DILexicalBlock(scope: !88, file: !14, line: 90, column: 5)
!104 = !DILocation(line: 91, column: 14, scope: !103)
!105 = !DILocation(line: 93, column: 16, scope: !103)
!106 = !DILocation(line: 93, column: 22, scope: !103)
!107 = !DILocation(line: 93, column: 9, scope: !103)
!108 = !DILocation(line: 94, column: 19, scope: !103)
!109 = !DILocation(line: 94, column: 9, scope: !103)
!110 = !DILocation(line: 96, column: 1, scope: !88)
