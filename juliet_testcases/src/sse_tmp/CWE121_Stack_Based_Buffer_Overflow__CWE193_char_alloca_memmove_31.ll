; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
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
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  %7 = load i8*, i8** %data1, align 8, !dbg !42
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !44
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !45
  %add = add i64 %call, 1, !dbg !46
  %mul = mul i64 %add, 1, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !43
  %8 = load i8*, i8** %data1, align 8, !dbg !48
  call void @printLine(i8* %8), !dbg !49
  ret void, !dbg !50
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 10, align 16, !dbg !78
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %1 = alloca i8, i64 11, align 16, !dbg !81
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !80
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !82
  store i8* %2, i8** %data, align 8, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !86, metadata !DIExpression()), !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  store i8* %4, i8** %dataCopy, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !90, metadata !DIExpression()), !dbg !91
  %5 = load i8*, i8** %dataCopy, align 8, !dbg !92
  store i8* %5, i8** %data1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !95
  %7 = load i8*, i8** %data1, align 8, !dbg !96
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !97
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !98
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !99
  %add = add i64 %call, 1, !dbg !100
  %mul = mul i64 %add, 1, !dbg !101
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !97
  %8 = load i8*, i8** %data1, align 8, !dbg !102
  call void @printLine(i8* %8), !dbg !103
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 35, column: 12, scope: !13)
!26 = !DILocation(line: 35, column: 10, scope: !13)
!27 = !DILocation(line: 36, column: 5, scope: !13)
!28 = !DILocation(line: 36, column: 13, scope: !13)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !14, line: 38, type: !4)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!31 = !DILocation(line: 38, column: 16, scope: !30)
!32 = !DILocation(line: 38, column: 27, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !14, line: 39, type: !4)
!34 = !DILocation(line: 39, column: 16, scope: !30)
!35 = !DILocation(line: 39, column: 23, scope: !30)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 41, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 40, column: 9)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 41, column: 18, scope: !37)
!42 = !DILocation(line: 44, column: 21, scope: !37)
!43 = !DILocation(line: 44, column: 13, scope: !37)
!44 = !DILocation(line: 44, column: 43, scope: !37)
!45 = !DILocation(line: 44, column: 36, scope: !37)
!46 = !DILocation(line: 44, column: 51, scope: !37)
!47 = !DILocation(line: 44, column: 56, scope: !37)
!48 = !DILocation(line: 45, column: 23, scope: !37)
!49 = !DILocation(line: 45, column: 13, scope: !37)
!50 = !DILocation(line: 48, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_31_good", scope: !14, file: !14, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 79, column: 5, scope: !51)
!53 = !DILocation(line: 80, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !55, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 91, type: !57)
!60 = !DILocation(line: 91, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 91, type: !58)
!62 = !DILocation(line: 91, column: 27, scope: !54)
!63 = !DILocation(line: 94, column: 22, scope: !54)
!64 = !DILocation(line: 94, column: 12, scope: !54)
!65 = !DILocation(line: 94, column: 5, scope: !54)
!66 = !DILocation(line: 96, column: 5, scope: !54)
!67 = !DILocation(line: 97, column: 5, scope: !54)
!68 = !DILocation(line: 98, column: 5, scope: !54)
!69 = !DILocation(line: 101, column: 5, scope: !54)
!70 = !DILocation(line: 102, column: 5, scope: !54)
!71 = !DILocation(line: 103, column: 5, scope: !54)
!72 = !DILocation(line: 105, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 57, type: !4)
!75 = !DILocation(line: 57, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !14, line: 58, type: !4)
!77 = !DILocation(line: 58, column: 12, scope: !73)
!78 = !DILocation(line: 58, column: 36, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !14, line: 59, type: !4)
!80 = !DILocation(line: 59, column: 12, scope: !73)
!81 = !DILocation(line: 59, column: 37, scope: !73)
!82 = !DILocation(line: 62, column: 12, scope: !73)
!83 = !DILocation(line: 62, column: 10, scope: !73)
!84 = !DILocation(line: 63, column: 5, scope: !73)
!85 = !DILocation(line: 63, column: 13, scope: !73)
!86 = !DILocalVariable(name: "dataCopy", scope: !87, file: !14, line: 65, type: !4)
!87 = distinct !DILexicalBlock(scope: !73, file: !14, line: 64, column: 5)
!88 = !DILocation(line: 65, column: 16, scope: !87)
!89 = !DILocation(line: 65, column: 27, scope: !87)
!90 = !DILocalVariable(name: "data", scope: !87, file: !14, line: 66, type: !4)
!91 = !DILocation(line: 66, column: 16, scope: !87)
!92 = !DILocation(line: 66, column: 23, scope: !87)
!93 = !DILocalVariable(name: "source", scope: !94, file: !14, line: 68, type: !38)
!94 = distinct !DILexicalBlock(scope: !87, file: !14, line: 67, column: 9)
!95 = !DILocation(line: 68, column: 18, scope: !94)
!96 = !DILocation(line: 71, column: 21, scope: !94)
!97 = !DILocation(line: 71, column: 13, scope: !94)
!98 = !DILocation(line: 71, column: 43, scope: !94)
!99 = !DILocation(line: 71, column: 36, scope: !94)
!100 = !DILocation(line: 71, column: 51, scope: !94)
!101 = !DILocation(line: 71, column: 56, scope: !94)
!102 = !DILocation(line: 72, column: 23, scope: !94)
!103 = !DILocation(line: 72, column: 13, scope: !94)
!104 = !DILocation(line: 75, column: 1, scope: !73)
