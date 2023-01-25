; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !24
  %1 = load i8*, i8** %data.addr, align 8, !dbg !25
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !26
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !27
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !28
  %add = add i64 %call, 1, !dbg !29
  %mul = mul i64 %add, 1, !dbg !30
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !26
  %2 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @printLine(i8* %2), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = alloca i8, i64 10, align 16, !dbg !41
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !42, metadata !DIExpression()), !dbg !43
  %1 = alloca i8, i64 11, align 16, !dbg !44
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !43
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !45
  store i8* %2, i8** %data, align 8, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_badSink(i8* %4), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_goodG2BSink(i8* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !57
  %1 = load i8*, i8** %data.addr, align 8, !dbg !58
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !59
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !60
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !61
  %add = add i64 %call, 1, !dbg !62
  %mul = mul i64 %add, 1, !dbg !63
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !59
  %2 = load i8*, i8** %data.addr, align 8, !dbg !64
  call void @printLine(i8* %2), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #7, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #7, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = alloca i8, i64 10, align 16, !dbg !94
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %1 = alloca i8, i64 11, align 16, !dbg !97
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !96
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !98
  store i8* %2, i8** %data, align 8, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_goodG2BSink(i8* %4), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_badSink", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 87, scope: !13)
!19 = !DILocalVariable(name: "source", scope: !20, file: !14, line: 31, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 31, column: 14, scope: !20)
!25 = !DILocation(line: 34, column: 17, scope: !20)
!26 = !DILocation(line: 34, column: 9, scope: !20)
!27 = !DILocation(line: 34, column: 39, scope: !20)
!28 = !DILocation(line: 34, column: 32, scope: !20)
!29 = !DILocation(line: 34, column: 47, scope: !20)
!30 = !DILocation(line: 34, column: 52, scope: !20)
!31 = !DILocation(line: 35, column: 19, scope: !20)
!32 = !DILocation(line: 35, column: 9, scope: !20)
!33 = !DILocation(line: 37, column: 1, scope: !13)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_bad", scope: !14, file: !14, line: 39, type: !35, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocalVariable(name: "data", scope: !34, file: !14, line: 41, type: !4)
!38 = !DILocation(line: 41, column: 12, scope: !34)
!39 = !DILocalVariable(name: "dataBadBuffer", scope: !34, file: !14, line: 42, type: !4)
!40 = !DILocation(line: 42, column: 12, scope: !34)
!41 = !DILocation(line: 42, column: 36, scope: !34)
!42 = !DILocalVariable(name: "dataGoodBuffer", scope: !34, file: !14, line: 43, type: !4)
!43 = !DILocation(line: 43, column: 12, scope: !34)
!44 = !DILocation(line: 43, column: 37, scope: !34)
!45 = !DILocation(line: 46, column: 12, scope: !34)
!46 = !DILocation(line: 46, column: 10, scope: !34)
!47 = !DILocation(line: 47, column: 5, scope: !34)
!48 = !DILocation(line: 47, column: 13, scope: !34)
!49 = !DILocation(line: 48, column: 79, scope: !34)
!50 = !DILocation(line: 48, column: 5, scope: !34)
!51 = !DILocation(line: 49, column: 1, scope: !34)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_goodG2BSink", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !14, line: 55, type: !4)
!54 = !DILocation(line: 55, column: 91, scope: !52)
!55 = !DILocalVariable(name: "source", scope: !56, file: !14, line: 58, type: !21)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 57, column: 5)
!57 = !DILocation(line: 58, column: 14, scope: !56)
!58 = !DILocation(line: 61, column: 17, scope: !56)
!59 = !DILocation(line: 61, column: 9, scope: !56)
!60 = !DILocation(line: 61, column: 39, scope: !56)
!61 = !DILocation(line: 61, column: 32, scope: !56)
!62 = !DILocation(line: 61, column: 47, scope: !56)
!63 = !DILocation(line: 61, column: 52, scope: !56)
!64 = !DILocation(line: 62, column: 19, scope: !56)
!65 = !DILocation(line: 62, column: 9, scope: !56)
!66 = !DILocation(line: 64, column: 1, scope: !52)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_41_good", scope: !14, file: !14, line: 79, type: !35, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 81, column: 5, scope: !67)
!69 = !DILocation(line: 82, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !71, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !73, !74}
!73 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !14, line: 94, type: !73)
!76 = !DILocation(line: 94, column: 14, scope: !70)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !14, line: 94, type: !74)
!78 = !DILocation(line: 94, column: 27, scope: !70)
!79 = !DILocation(line: 97, column: 22, scope: !70)
!80 = !DILocation(line: 97, column: 12, scope: !70)
!81 = !DILocation(line: 97, column: 5, scope: !70)
!82 = !DILocation(line: 99, column: 5, scope: !70)
!83 = !DILocation(line: 100, column: 5, scope: !70)
!84 = !DILocation(line: 101, column: 5, scope: !70)
!85 = !DILocation(line: 104, column: 5, scope: !70)
!86 = !DILocation(line: 105, column: 5, scope: !70)
!87 = !DILocation(line: 106, column: 5, scope: !70)
!88 = !DILocation(line: 108, column: 5, scope: !70)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 67, type: !35, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !14, line: 69, type: !4)
!91 = !DILocation(line: 69, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !14, line: 70, type: !4)
!93 = !DILocation(line: 70, column: 12, scope: !89)
!94 = !DILocation(line: 70, column: 36, scope: !89)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !14, line: 71, type: !4)
!96 = !DILocation(line: 71, column: 12, scope: !89)
!97 = !DILocation(line: 71, column: 37, scope: !89)
!98 = !DILocation(line: 74, column: 12, scope: !89)
!99 = !DILocation(line: 74, column: 10, scope: !89)
!100 = !DILocation(line: 75, column: 5, scope: !89)
!101 = !DILocation(line: 75, column: 13, scope: !89)
!102 = !DILocation(line: 76, column: 83, scope: !89)
!103 = !DILocation(line: 76, column: 5, scope: !89)
!104 = !DILocation(line: 77, column: 1, scope: !89)
