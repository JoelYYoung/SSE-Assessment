; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %1, i8** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !39
  store i8* %2, i8** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  %3 = load i8*, i8** %data1, align 8, !dbg !46
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  %call = call i8* @strncpy(i8* %3, i8* %arraydecay4, i64 99) #5, !dbg !48
  %4 = load i8*, i8** %data1, align 8, !dbg !49
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !49
  store i8 0, i8* %arrayidx5, align 1, !dbg !50
  %5 = load i8*, i8** %data1, align 8, !dbg !51
  call void @printLine(i8* %5), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !83
  store i8* %arraydecay, i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !87, metadata !DIExpression()), !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  store i8* %1, i8** %dataCopy, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !93
  store i8* %2, i8** %data1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx3, align 1, !dbg !99
  %3 = load i8*, i8** %data1, align 8, !dbg !100
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  %call = call i8* @strncpy(i8* %3, i8* %arraydecay4, i64 99) #5, !dbg !102
  %4 = load i8*, i8** %data1, align 8, !dbg !103
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !103
  store i8 0, i8* %arrayidx5, align 1, !dbg !104
  %5 = load i8*, i8** %data1, align 8, !dbg !105
  call void @printLine(i8* %5), !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 30, column: 12, scope: !11)
!30 = !DILocation(line: 30, column: 10, scope: !11)
!31 = !DILocation(line: 31, column: 5, scope: !11)
!32 = !DILocation(line: 31, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !12, line: 33, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 16, scope: !34)
!36 = !DILocation(line: 33, column: 27, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 34, type: !16)
!38 = !DILocation(line: 34, column: 16, scope: !34)
!39 = !DILocation(line: 34, column: 23, scope: !34)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 36, type: !25)
!41 = distinct !DILexicalBlock(scope: !34, file: !12, line: 35, column: 9)
!42 = !DILocation(line: 36, column: 18, scope: !41)
!43 = !DILocation(line: 37, column: 13, scope: !41)
!44 = !DILocation(line: 38, column: 13, scope: !41)
!45 = !DILocation(line: 38, column: 27, scope: !41)
!46 = !DILocation(line: 40, column: 21, scope: !41)
!47 = !DILocation(line: 40, column: 27, scope: !41)
!48 = !DILocation(line: 40, column: 13, scope: !41)
!49 = !DILocation(line: 41, column: 13, scope: !41)
!50 = !DILocation(line: 41, column: 25, scope: !41)
!51 = !DILocation(line: 42, column: 23, scope: !41)
!52 = !DILocation(line: 42, column: 13, scope: !41)
!53 = !DILocation(line: 45, column: 1, scope: !11)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_ncpy_31_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 77, column: 5, scope: !54)
!56 = !DILocation(line: 78, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !58, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 89, type: !60)
!63 = !DILocation(line: 89, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 89, type: !61)
!65 = !DILocation(line: 89, column: 27, scope: !57)
!66 = !DILocation(line: 92, column: 22, scope: !57)
!67 = !DILocation(line: 92, column: 12, scope: !57)
!68 = !DILocation(line: 92, column: 5, scope: !57)
!69 = !DILocation(line: 94, column: 5, scope: !57)
!70 = !DILocation(line: 95, column: 5, scope: !57)
!71 = !DILocation(line: 96, column: 5, scope: !57)
!72 = !DILocation(line: 99, column: 5, scope: !57)
!73 = !DILocation(line: 100, column: 5, scope: !57)
!74 = !DILocation(line: 101, column: 5, scope: !57)
!75 = !DILocation(line: 103, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 54, type: !16)
!78 = !DILocation(line: 54, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !12, line: 55, type: !20)
!80 = !DILocation(line: 55, column: 10, scope: !76)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !12, line: 56, type: !25)
!82 = !DILocation(line: 56, column: 10, scope: !76)
!83 = !DILocation(line: 58, column: 12, scope: !76)
!84 = !DILocation(line: 58, column: 10, scope: !76)
!85 = !DILocation(line: 59, column: 5, scope: !76)
!86 = !DILocation(line: 59, column: 13, scope: !76)
!87 = !DILocalVariable(name: "dataCopy", scope: !88, file: !12, line: 61, type: !16)
!88 = distinct !DILexicalBlock(scope: !76, file: !12, line: 60, column: 5)
!89 = !DILocation(line: 61, column: 16, scope: !88)
!90 = !DILocation(line: 61, column: 27, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 62, type: !16)
!92 = !DILocation(line: 62, column: 16, scope: !88)
!93 = !DILocation(line: 62, column: 23, scope: !88)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 64, type: !25)
!95 = distinct !DILexicalBlock(scope: !88, file: !12, line: 63, column: 9)
!96 = !DILocation(line: 64, column: 18, scope: !95)
!97 = !DILocation(line: 65, column: 13, scope: !95)
!98 = !DILocation(line: 66, column: 13, scope: !95)
!99 = !DILocation(line: 66, column: 27, scope: !95)
!100 = !DILocation(line: 68, column: 21, scope: !95)
!101 = !DILocation(line: 68, column: 27, scope: !95)
!102 = !DILocation(line: 68, column: 13, scope: !95)
!103 = !DILocation(line: 69, column: 13, scope: !95)
!104 = !DILocation(line: 69, column: 25, scope: !95)
!105 = !DILocation(line: 70, column: 23, scope: !95)
!106 = !DILocation(line: 70, column: 13, scope: !95)
!107 = !DILocation(line: 73, column: 1, scope: !76)
