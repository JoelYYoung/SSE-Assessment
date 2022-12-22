; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %call = call i8* @strcpy(i8* %arraydecay, i8* %1) #5, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !28
  call void @printLine(i8* %2), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_bad() #0 !dbg !31 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = alloca i8, i64 100, align 16, !dbg !38
  store i8* %0, i8** %dataBuffer, align 8, !dbg !37
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !39
  store i8* %1, i8** %data, align 8, !dbg !40
  %2 = load i8*, i8** %data, align 8, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_badSink(i8* %4), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_goodG2BSink(i8* %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !53
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !53
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !54
  %1 = load i8*, i8** %data.addr, align 8, !dbg !55
  %call = call i8* @strcpy(i8* %arraydecay, i8* %1) #5, !dbg !56
  %2 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @printLine(i8* %2), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #5, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #5, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %0, i8** %dataBuffer, align 8, !dbg !86
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  store i8* %1, i8** %data, align 8, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_goodG2BSink(i8* %4), !dbg !95
  ret void, !dbg !96
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 80, scope: !13)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 28, column: 16, scope: !20)
!26 = !DILocation(line: 28, column: 22, scope: !20)
!27 = !DILocation(line: 28, column: 9, scope: !20)
!28 = !DILocation(line: 29, column: 19, scope: !20)
!29 = !DILocation(line: 29, column: 9, scope: !20)
!30 = !DILocation(line: 31, column: 1, scope: !13)
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_bad", scope: !14, file: !14, line: 33, type: !32, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocalVariable(name: "data", scope: !31, file: !14, line: 35, type: !4)
!35 = !DILocation(line: 35, column: 12, scope: !31)
!36 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !14, line: 36, type: !4)
!37 = !DILocation(line: 36, column: 12, scope: !31)
!38 = !DILocation(line: 36, column: 33, scope: !31)
!39 = !DILocation(line: 37, column: 12, scope: !31)
!40 = !DILocation(line: 37, column: 10, scope: !31)
!41 = !DILocation(line: 39, column: 12, scope: !31)
!42 = !DILocation(line: 39, column: 5, scope: !31)
!43 = !DILocation(line: 40, column: 5, scope: !31)
!44 = !DILocation(line: 40, column: 17, scope: !31)
!45 = !DILocation(line: 41, column: 72, scope: !31)
!46 = !DILocation(line: 41, column: 5, scope: !31)
!47 = !DILocation(line: 42, column: 1, scope: !31)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_goodG2BSink", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !14, line: 48, type: !4)
!50 = !DILocation(line: 48, column: 84, scope: !48)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !14, line: 51, type: !21)
!52 = distinct !DILexicalBlock(scope: !48, file: !14, line: 50, column: 5)
!53 = !DILocation(line: 51, column: 14, scope: !52)
!54 = !DILocation(line: 53, column: 16, scope: !52)
!55 = !DILocation(line: 53, column: 22, scope: !52)
!56 = !DILocation(line: 53, column: 9, scope: !52)
!57 = !DILocation(line: 54, column: 19, scope: !52)
!58 = !DILocation(line: 54, column: 9, scope: !52)
!59 = !DILocation(line: 56, column: 1, scope: !48)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_41_good", scope: !14, file: !14, line: 70, type: !32, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 72, column: 5, scope: !60)
!62 = !DILocation(line: 73, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 85, type: !64, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 85, type: !66)
!69 = !DILocation(line: 85, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 85, type: !67)
!71 = !DILocation(line: 85, column: 27, scope: !63)
!72 = !DILocation(line: 88, column: 22, scope: !63)
!73 = !DILocation(line: 88, column: 12, scope: !63)
!74 = !DILocation(line: 88, column: 5, scope: !63)
!75 = !DILocation(line: 90, column: 5, scope: !63)
!76 = !DILocation(line: 91, column: 5, scope: !63)
!77 = !DILocation(line: 92, column: 5, scope: !63)
!78 = !DILocation(line: 95, column: 5, scope: !63)
!79 = !DILocation(line: 96, column: 5, scope: !63)
!80 = !DILocation(line: 97, column: 5, scope: !63)
!81 = !DILocation(line: 99, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !32, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 61, type: !4)
!84 = !DILocation(line: 61, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !14, line: 62, type: !4)
!86 = !DILocation(line: 62, column: 12, scope: !82)
!87 = !DILocation(line: 62, column: 33, scope: !82)
!88 = !DILocation(line: 63, column: 12, scope: !82)
!89 = !DILocation(line: 63, column: 10, scope: !82)
!90 = !DILocation(line: 65, column: 12, scope: !82)
!91 = !DILocation(line: 65, column: 5, scope: !82)
!92 = !DILocation(line: 66, column: 5, scope: !82)
!93 = !DILocation(line: 66, column: 16, scope: !82)
!94 = !DILocation(line: 67, column: 76, scope: !82)
!95 = !DILocation(line: 67, column: 5, scope: !82)
!96 = !DILocation(line: 68, column: 1, scope: !82)
