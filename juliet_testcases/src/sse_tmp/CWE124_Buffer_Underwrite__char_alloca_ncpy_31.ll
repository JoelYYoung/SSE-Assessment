; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !27
  store i8* %add.ptr, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !29, metadata !DIExpression()), !dbg !31
  %4 = load i8*, i8** %data, align 8, !dbg !32
  store i8* %4, i8** %dataCopy, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !33, metadata !DIExpression()), !dbg !34
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !35
  store i8* %5, i8** %data1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx2, align 1, !dbg !44
  %6 = load i8*, i8** %data1, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #5, !dbg !47
  %7 = load i8*, i8** %data1, align 8, !dbg !48
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !48
  store i8 0, i8* %arrayidx4, align 1, !dbg !49
  %8 = load i8*, i8** %data1, align 8, !dbg !50
  call void @printLine(i8* %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_31_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_31_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_31_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %0, i8** %dataBuffer, align 8, !dbg !79
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !82
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  store i8* %3, i8** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !87, metadata !DIExpression()), !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  store i8* %4, i8** %dataCopy, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !91, metadata !DIExpression()), !dbg !92
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !93
  store i8* %5, i8** %data1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx2, align 1, !dbg !99
  %6 = load i8*, i8** %data1, align 8, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  %call = call i8* @strncpy(i8* %6, i8* %arraydecay3, i64 99) #5, !dbg !102
  %7 = load i8*, i8** %data1, align 8, !dbg !103
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !103
  store i8 0, i8* %arrayidx4, align 1, !dbg !104
  %8 = load i8*, i8** %data1, align 8, !dbg !105
  call void @printLine(i8* %8), !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 30, column: 12, scope: !13)
!27 = !DILocation(line: 30, column: 23, scope: !13)
!28 = !DILocation(line: 30, column: 10, scope: !13)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !14, line: 32, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!31 = !DILocation(line: 32, column: 16, scope: !30)
!32 = !DILocation(line: 32, column: 27, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 33, type: !4)
!34 = !DILocation(line: 33, column: 16, scope: !30)
!35 = !DILocation(line: 33, column: 23, scope: !30)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 34, column: 9)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 35, column: 18, scope: !37)
!42 = !DILocation(line: 36, column: 13, scope: !37)
!43 = !DILocation(line: 37, column: 13, scope: !37)
!44 = !DILocation(line: 37, column: 27, scope: !37)
!45 = !DILocation(line: 39, column: 21, scope: !37)
!46 = !DILocation(line: 39, column: 27, scope: !37)
!47 = !DILocation(line: 39, column: 13, scope: !37)
!48 = !DILocation(line: 41, column: 13, scope: !37)
!49 = !DILocation(line: 41, column: 25, scope: !37)
!50 = !DILocation(line: 42, column: 23, scope: !37)
!51 = !DILocation(line: 42, column: 13, scope: !37)
!52 = !DILocation(line: 45, column: 1, scope: !13)
!53 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_31_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 78, column: 5, scope: !53)
!55 = !DILocation(line: 79, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 90, type: !57, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !14, line: 90, type: !59)
!62 = !DILocation(line: 90, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !14, line: 90, type: !60)
!64 = !DILocation(line: 90, column: 27, scope: !56)
!65 = !DILocation(line: 93, column: 22, scope: !56)
!66 = !DILocation(line: 93, column: 12, scope: !56)
!67 = !DILocation(line: 93, column: 5, scope: !56)
!68 = !DILocation(line: 95, column: 5, scope: !56)
!69 = !DILocation(line: 96, column: 5, scope: !56)
!70 = !DILocation(line: 97, column: 5, scope: !56)
!71 = !DILocation(line: 100, column: 5, scope: !56)
!72 = !DILocation(line: 101, column: 5, scope: !56)
!73 = !DILocation(line: 102, column: 5, scope: !56)
!74 = !DILocation(line: 104, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !14, line: 54, type: !4)
!77 = !DILocation(line: 54, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !14, line: 55, type: !4)
!79 = !DILocation(line: 55, column: 12, scope: !75)
!80 = !DILocation(line: 55, column: 33, scope: !75)
!81 = !DILocation(line: 56, column: 12, scope: !75)
!82 = !DILocation(line: 56, column: 5, scope: !75)
!83 = !DILocation(line: 57, column: 5, scope: !75)
!84 = !DILocation(line: 57, column: 23, scope: !75)
!85 = !DILocation(line: 59, column: 12, scope: !75)
!86 = !DILocation(line: 59, column: 10, scope: !75)
!87 = !DILocalVariable(name: "dataCopy", scope: !88, file: !14, line: 61, type: !4)
!88 = distinct !DILexicalBlock(scope: !75, file: !14, line: 60, column: 5)
!89 = !DILocation(line: 61, column: 16, scope: !88)
!90 = !DILocation(line: 61, column: 27, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !14, line: 62, type: !4)
!92 = !DILocation(line: 62, column: 16, scope: !88)
!93 = !DILocation(line: 62, column: 23, scope: !88)
!94 = !DILocalVariable(name: "source", scope: !95, file: !14, line: 64, type: !38)
!95 = distinct !DILexicalBlock(scope: !88, file: !14, line: 63, column: 9)
!96 = !DILocation(line: 64, column: 18, scope: !95)
!97 = !DILocation(line: 65, column: 13, scope: !95)
!98 = !DILocation(line: 66, column: 13, scope: !95)
!99 = !DILocation(line: 66, column: 27, scope: !95)
!100 = !DILocation(line: 68, column: 21, scope: !95)
!101 = !DILocation(line: 68, column: 27, scope: !95)
!102 = !DILocation(line: 68, column: 13, scope: !95)
!103 = !DILocation(line: 70, column: 13, scope: !95)
!104 = !DILocation(line: 70, column: 25, scope: !95)
!105 = !DILocation(line: 71, column: 23, scope: !95)
!106 = !DILocation(line: 71, column: 13, scope: !95)
!107 = !DILocation(line: 74, column: 1, scope: !75)
