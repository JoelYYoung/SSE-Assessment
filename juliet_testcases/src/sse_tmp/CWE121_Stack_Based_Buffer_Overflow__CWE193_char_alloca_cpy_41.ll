; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !24
  %1 = load i8*, i8** %data.addr, align 8, !dbg !25
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !26
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay) #5, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !28
  call void @printLine(i8* %2), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_bad() #0 !dbg !31 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = alloca i8, i64 10, align 16, !dbg !38
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !39, metadata !DIExpression()), !dbg !40
  %1 = alloca i8, i64 11, align 16, !dbg !41
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !40
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !42
  store i8* %2, i8** %data, align 8, !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_badSink(i8* %4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_goodG2BSink(i8* %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !54
  %1 = load i8*, i8** %data.addr, align 8, !dbg !55
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay) #5, !dbg !57
  %2 = load i8*, i8** %data.addr, align 8, !dbg !58
  call void @printLine(i8* %2), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 10, align 16, !dbg !88
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %1 = alloca i8, i64 11, align 16, !dbg !91
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !90
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !92
  store i8* %2, i8** %data, align 8, !dbg !93
  %3 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_goodG2BSink(i8* %4), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_badSink", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 83, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 31, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 31, column: 14, scope: !20)
!25 = !DILocation(line: 33, column: 16, scope: !20)
!26 = !DILocation(line: 33, column: 22, scope: !20)
!27 = !DILocation(line: 33, column: 9, scope: !20)
!28 = !DILocation(line: 34, column: 19, scope: !20)
!29 = !DILocation(line: 34, column: 9, scope: !20)
!30 = !DILocation(line: 36, column: 1, scope: !13)
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_bad", scope: !14, file: !14, line: 38, type: !32, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 40, type: !4)
!35 = !DILocation(line: 40, column: 12, scope: !31)
!36 = !DILocalVariable(name: "dataBadBuffer", scope: !31, file: !14, line: 41, type: !4)
!37 = !DILocation(line: 41, column: 12, scope: !31)
!38 = !DILocation(line: 41, column: 36, scope: !31)
!39 = !DILocalVariable(name: "dataGoodBuffer", scope: !31, file: !14, line: 42, type: !4)
!40 = !DILocation(line: 42, column: 12, scope: !31)
!41 = !DILocation(line: 42, column: 37, scope: !31)
!42 = !DILocation(line: 45, column: 12, scope: !31)
!43 = !DILocation(line: 45, column: 10, scope: !31)
!44 = !DILocation(line: 46, column: 5, scope: !31)
!45 = !DILocation(line: 46, column: 13, scope: !31)
!46 = !DILocation(line: 47, column: 75, scope: !31)
!47 = !DILocation(line: 47, column: 5, scope: !31)
!48 = !DILocation(line: 48, column: 1, scope: !31)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_goodG2BSink", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !14, line: 54, type: !4)
!51 = !DILocation(line: 54, column: 87, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !14, line: 57, type: !21)
!53 = distinct !DILexicalBlock(scope: !49, file: !14, line: 56, column: 5)
!54 = !DILocation(line: 57, column: 14, scope: !53)
!55 = !DILocation(line: 59, column: 16, scope: !53)
!56 = !DILocation(line: 59, column: 22, scope: !53)
!57 = !DILocation(line: 59, column: 9, scope: !53)
!58 = !DILocation(line: 60, column: 19, scope: !53)
!59 = !DILocation(line: 60, column: 9, scope: !53)
!60 = !DILocation(line: 62, column: 1, scope: !49)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_41_good", scope: !14, file: !14, line: 77, type: !32, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 79, column: 5, scope: !61)
!63 = !DILocation(line: 80, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 92, type: !65, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !14, line: 92, type: !67)
!70 = !DILocation(line: 92, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !14, line: 92, type: !68)
!72 = !DILocation(line: 92, column: 27, scope: !64)
!73 = !DILocation(line: 95, column: 22, scope: !64)
!74 = !DILocation(line: 95, column: 12, scope: !64)
!75 = !DILocation(line: 95, column: 5, scope: !64)
!76 = !DILocation(line: 97, column: 5, scope: !64)
!77 = !DILocation(line: 98, column: 5, scope: !64)
!78 = !DILocation(line: 99, column: 5, scope: !64)
!79 = !DILocation(line: 102, column: 5, scope: !64)
!80 = !DILocation(line: 103, column: 5, scope: !64)
!81 = !DILocation(line: 104, column: 5, scope: !64)
!82 = !DILocation(line: 106, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !32, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 67, type: !4)
!85 = !DILocation(line: 67, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !14, line: 68, type: !4)
!87 = !DILocation(line: 68, column: 12, scope: !83)
!88 = !DILocation(line: 68, column: 36, scope: !83)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !14, line: 69, type: !4)
!90 = !DILocation(line: 69, column: 12, scope: !83)
!91 = !DILocation(line: 69, column: 37, scope: !83)
!92 = !DILocation(line: 72, column: 12, scope: !83)
!93 = !DILocation(line: 72, column: 10, scope: !83)
!94 = !DILocation(line: 73, column: 5, scope: !83)
!95 = !DILocation(line: 73, column: 13, scope: !83)
!96 = !DILocation(line: 74, column: 79, scope: !83)
!97 = !DILocation(line: 74, column: 5, scope: !83)
!98 = !DILocation(line: 75, column: 1, scope: !83)
