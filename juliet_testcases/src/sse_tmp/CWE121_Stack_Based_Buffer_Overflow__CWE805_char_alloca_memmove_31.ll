; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %6, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !46
  %7 = load i8*, i8** %data1, align 8, !dbg !47
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !47
  store i8 0, i8* %arrayidx4, align 1, !dbg !48
  %8 = load i8*, i8** %data1, align 8, !dbg !49
  call void @printLine(i8* %8), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 50, align 16, !dbg !79
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %1 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !81
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !83
  store i8* %2, i8** %data, align 8, !dbg !84
  %3 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %6, i8* align 16 %arraydecay3, i64 100, i1 false), !dbg !101
  %7 = load i8*, i8** %data1, align 8, !dbg !102
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !102
  store i8 0, i8* %arrayidx4, align 1, !dbg !103
  %8 = load i8*, i8** %data1, align 8, !dbg !104
  call void @printLine(i8* %8), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 30, column: 12, scope: !13)
!26 = !DILocation(line: 30, column: 10, scope: !13)
!27 = !DILocation(line: 31, column: 5, scope: !13)
!28 = !DILocation(line: 31, column: 13, scope: !13)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !14, line: 33, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!31 = !DILocation(line: 33, column: 16, scope: !30)
!32 = !DILocation(line: 33, column: 27, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 34, type: !4)
!34 = !DILocation(line: 34, column: 16, scope: !30)
!35 = !DILocation(line: 34, column: 23, scope: !30)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 35, column: 9)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 36, column: 18, scope: !37)
!42 = !DILocation(line: 37, column: 13, scope: !37)
!43 = !DILocation(line: 38, column: 13, scope: !37)
!44 = !DILocation(line: 38, column: 27, scope: !37)
!45 = !DILocation(line: 40, column: 21, scope: !37)
!46 = !DILocation(line: 40, column: 13, scope: !37)
!47 = !DILocation(line: 41, column: 13, scope: !37)
!48 = !DILocation(line: 41, column: 25, scope: !37)
!49 = !DILocation(line: 42, column: 23, scope: !37)
!50 = !DILocation(line: 42, column: 13, scope: !37)
!51 = !DILocation(line: 45, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memmove_31_good", scope: !14, file: !14, line: 75, type: !15, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 77, column: 5, scope: !52)
!54 = !DILocation(line: 78, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 89, type: !56, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 89, type: !58)
!61 = !DILocation(line: 89, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 89, type: !59)
!63 = !DILocation(line: 89, column: 27, scope: !55)
!64 = !DILocation(line: 92, column: 22, scope: !55)
!65 = !DILocation(line: 92, column: 12, scope: !55)
!66 = !DILocation(line: 92, column: 5, scope: !55)
!67 = !DILocation(line: 94, column: 5, scope: !55)
!68 = !DILocation(line: 95, column: 5, scope: !55)
!69 = !DILocation(line: 96, column: 5, scope: !55)
!70 = !DILocation(line: 99, column: 5, scope: !55)
!71 = !DILocation(line: 100, column: 5, scope: !55)
!72 = !DILocation(line: 101, column: 5, scope: !55)
!73 = !DILocation(line: 103, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 54, type: !4)
!76 = !DILocation(line: 54, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !14, line: 55, type: !4)
!78 = !DILocation(line: 55, column: 12, scope: !74)
!79 = !DILocation(line: 55, column: 36, scope: !74)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !14, line: 56, type: !4)
!81 = !DILocation(line: 56, column: 12, scope: !74)
!82 = !DILocation(line: 56, column: 37, scope: !74)
!83 = !DILocation(line: 58, column: 12, scope: !74)
!84 = !DILocation(line: 58, column: 10, scope: !74)
!85 = !DILocation(line: 59, column: 5, scope: !74)
!86 = !DILocation(line: 59, column: 13, scope: !74)
!87 = !DILocalVariable(name: "dataCopy", scope: !88, file: !14, line: 61, type: !4)
!88 = distinct !DILexicalBlock(scope: !74, file: !14, line: 60, column: 5)
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
!101 = !DILocation(line: 68, column: 13, scope: !95)
!102 = !DILocation(line: 69, column: 13, scope: !95)
!103 = !DILocation(line: 69, column: 25, scope: !95)
!104 = !DILocation(line: 70, column: 23, scope: !95)
!105 = !DILocation(line: 70, column: 13, scope: !95)
!106 = !DILocation(line: 73, column: 1, scope: !74)
