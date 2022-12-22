; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %1 = load i32*, i32** %0, align 8, !dbg !40
  store i32* %1, i32** %data1, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %3 = load i32*, i32** %data1, align 8, !dbg !45
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %3, i32** %4, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %6 = load i32*, i32** %5, align 8, !dbg !52
  store i32* %6, i32** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_bad.source to i8*), i64 44, i1 false), !dbg !55
  %8 = load i32*, i32** %data2, align 8, !dbg !56
  %9 = bitcast i32* %8 to i8*, !dbg !57
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !57
  %10 = bitcast i32* %arraydecay3 to i8*, !dbg !57
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !58
  %call = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !59
  %add = add i64 %call, 1, !dbg !60
  %mul = mul i64 %add, 4, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !57
  %11 = load i32*, i32** %data2, align 8, !dbg !62
  call void @printWLine(i32* %11), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !91, metadata !DIExpression()), !dbg !92
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !99, metadata !DIExpression()), !dbg !101
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !102
  %1 = load i32*, i32** %0, align 8, !dbg !103
  store i32* %1, i32** %data1, align 8, !dbg !101
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay, i32** %data1, align 8, !dbg !105
  %2 = load i32*, i32** %data1, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %3 = load i32*, i32** %data1, align 8, !dbg !108
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  store i32* %3, i32** %4, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !111, metadata !DIExpression()), !dbg !113
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !114
  %6 = load i32*, i32** %5, align 8, !dbg !115
  store i32* %6, i32** %data2, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !118
  %8 = load i32*, i32** %data2, align 8, !dbg !119
  %9 = bitcast i32* %8 to i8*, !dbg !120
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !120
  %10 = bitcast i32* %arraydecay3 to i8*, !dbg !120
  %arraydecay4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %call = call i64 @wcslen(i32* %arraydecay4) #6, !dbg !122
  %add = add i64 %call, 1, !dbg !123
  %mul = mul i64 %add, 4, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !120
  %11 = load i32*, i32** %data2, align 8, !dbg !125
  call void @printWLine(i32* %11), !dbg !126
  ret void, !dbg !127
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 31, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 31, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 32, type: !22)
!25 = !DILocation(line: 32, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 33, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 34, column: 13, scope: !11)
!36 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 36, type: !16)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!38 = !DILocation(line: 36, column: 19, scope: !37)
!39 = !DILocation(line: 36, column: 27, scope: !37)
!40 = !DILocation(line: 36, column: 26, scope: !37)
!41 = !DILocation(line: 39, column: 16, scope: !37)
!42 = !DILocation(line: 39, column: 14, scope: !37)
!43 = !DILocation(line: 40, column: 9, scope: !37)
!44 = !DILocation(line: 40, column: 17, scope: !37)
!45 = !DILocation(line: 41, column: 21, scope: !37)
!46 = !DILocation(line: 41, column: 10, scope: !37)
!47 = !DILocation(line: 41, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 44, type: !16)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!50 = !DILocation(line: 44, column: 19, scope: !49)
!51 = !DILocation(line: 44, column: 27, scope: !49)
!52 = !DILocation(line: 44, column: 26, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 46, type: !32)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 45, column: 9)
!55 = !DILocation(line: 46, column: 21, scope: !54)
!56 = !DILocation(line: 49, column: 20, scope: !54)
!57 = !DILocation(line: 49, column: 13, scope: !54)
!58 = !DILocation(line: 49, column: 42, scope: !54)
!59 = !DILocation(line: 49, column: 35, scope: !54)
!60 = !DILocation(line: 49, column: 50, scope: !54)
!61 = !DILocation(line: 49, column: 55, scope: !54)
!62 = !DILocation(line: 50, column: 24, scope: !54)
!63 = !DILocation(line: 50, column: 13, scope: !54)
!64 = !DILocation(line: 53, column: 1, scope: !11)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_32_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 89, column: 5, scope: !65)
!67 = !DILocation(line: 90, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !69, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!19, !19, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !12, line: 101, type: !19)
!75 = !DILocation(line: 101, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !12, line: 101, type: !71)
!77 = !DILocation(line: 101, column: 27, scope: !68)
!78 = !DILocation(line: 104, column: 22, scope: !68)
!79 = !DILocation(line: 104, column: 12, scope: !68)
!80 = !DILocation(line: 104, column: 5, scope: !68)
!81 = !DILocation(line: 106, column: 5, scope: !68)
!82 = !DILocation(line: 107, column: 5, scope: !68)
!83 = !DILocation(line: 108, column: 5, scope: !68)
!84 = !DILocation(line: 111, column: 5, scope: !68)
!85 = !DILocation(line: 112, column: 5, scope: !68)
!86 = !DILocation(line: 113, column: 5, scope: !68)
!87 = !DILocation(line: 115, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 62, type: !16)
!90 = !DILocation(line: 62, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataPtr1", scope: !88, file: !12, line: 63, type: !22)
!92 = !DILocation(line: 63, column: 16, scope: !88)
!93 = !DILocalVariable(name: "dataPtr2", scope: !88, file: !12, line: 64, type: !22)
!94 = !DILocation(line: 64, column: 16, scope: !88)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !12, line: 65, type: !27)
!96 = !DILocation(line: 65, column: 13, scope: !88)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !12, line: 66, type: !32)
!98 = !DILocation(line: 66, column: 13, scope: !88)
!99 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 68, type: !16)
!100 = distinct !DILexicalBlock(scope: !88, file: !12, line: 67, column: 5)
!101 = !DILocation(line: 68, column: 19, scope: !100)
!102 = !DILocation(line: 68, column: 27, scope: !100)
!103 = !DILocation(line: 68, column: 26, scope: !100)
!104 = !DILocation(line: 71, column: 16, scope: !100)
!105 = !DILocation(line: 71, column: 14, scope: !100)
!106 = !DILocation(line: 72, column: 9, scope: !100)
!107 = !DILocation(line: 72, column: 17, scope: !100)
!108 = !DILocation(line: 73, column: 21, scope: !100)
!109 = !DILocation(line: 73, column: 10, scope: !100)
!110 = !DILocation(line: 73, column: 19, scope: !100)
!111 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 76, type: !16)
!112 = distinct !DILexicalBlock(scope: !88, file: !12, line: 75, column: 5)
!113 = !DILocation(line: 76, column: 19, scope: !112)
!114 = !DILocation(line: 76, column: 27, scope: !112)
!115 = !DILocation(line: 76, column: 26, scope: !112)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 78, type: !32)
!117 = distinct !DILexicalBlock(scope: !112, file: !12, line: 77, column: 9)
!118 = !DILocation(line: 78, column: 21, scope: !117)
!119 = !DILocation(line: 81, column: 20, scope: !117)
!120 = !DILocation(line: 81, column: 13, scope: !117)
!121 = !DILocation(line: 81, column: 42, scope: !117)
!122 = !DILocation(line: 81, column: 35, scope: !117)
!123 = !DILocation(line: 81, column: 50, scope: !117)
!124 = !DILocation(line: 81, column: 55, scope: !117)
!125 = !DILocation(line: 82, column: 24, scope: !117)
!126 = !DILocation(line: 82, column: 13, scope: !117)
!127 = !DILocation(line: 85, column: 1, scope: !88)
