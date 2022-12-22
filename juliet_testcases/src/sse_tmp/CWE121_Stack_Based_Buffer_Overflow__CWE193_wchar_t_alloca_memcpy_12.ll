; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  store i32* %6, i32** %data, align 8, !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  store i32 0, i32* %arrayidx1, align 4, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_bad.source to i8*), i64 44, i1 false), !dbg !48
  %9 = load i32*, i32** %data, align 8, !dbg !49
  %10 = bitcast i32* %9 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !50
  %11 = bitcast i32* %arraydecay to i8*, !dbg !50
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !52
  %add = add i64 %call3, 1, !dbg !53
  %mul = mul i64 %add, 4, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 %mul, i1 false), !dbg !50
  %12 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %12), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 40, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 44, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !92
  %tobool = icmp ne i32 %call, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !95
  store i32* %4, i32** %data, align 8, !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end, !dbg !100

if.else:                                          ; preds = %entry
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !101
  store i32* %6, i32** %data, align 8, !dbg !103
  %7 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !104
  store i32 0, i32* %arrayidx1, align 4, !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !108
  %9 = load i32*, i32** %data, align 8, !dbg !109
  %10 = bitcast i32* %9 to i8*, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !110
  %11 = bitcast i32* %arraydecay to i8*, !dbg !110
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !111
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !112
  %add = add i64 %call3, 1, !dbg !113
  %mul = mul i64 %add, 4, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 16 %11, i64 %mul, i1 false), !dbg !110
  %12 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %12), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 8, scope: !15)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !16, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 9, scope: !39)
!42 = !DILocation(line: 45, column: 17, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !16, line: 48, type: !45)
!44 = distinct !DILexicalBlock(scope: !15, file: !16, line: 47, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 48, column: 17, scope: !44)
!49 = !DILocation(line: 51, column: 16, scope: !44)
!50 = !DILocation(line: 51, column: 9, scope: !44)
!51 = !DILocation(line: 51, column: 38, scope: !44)
!52 = !DILocation(line: 51, column: 31, scope: !44)
!53 = !DILocation(line: 51, column: 46, scope: !44)
!54 = !DILocation(line: 51, column: 51, scope: !44)
!55 = !DILocation(line: 52, column: 20, scope: !44)
!56 = !DILocation(line: 52, column: 9, scope: !44)
!57 = !DILocation(line: 54, column: 1, scope: !15)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_12_good", scope: !16, file: !16, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 92, column: 5, scope: !58)
!60 = !DILocation(line: 93, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 105, type: !62, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !16, line: 105, type: !7)
!68 = !DILocation(line: 105, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !16, line: 105, type: !64)
!70 = !DILocation(line: 105, column: 27, scope: !61)
!71 = !DILocation(line: 108, column: 22, scope: !61)
!72 = !DILocation(line: 108, column: 12, scope: !61)
!73 = !DILocation(line: 108, column: 5, scope: !61)
!74 = !DILocation(line: 110, column: 5, scope: !61)
!75 = !DILocation(line: 111, column: 5, scope: !61)
!76 = !DILocation(line: 112, column: 5, scope: !61)
!77 = !DILocation(line: 115, column: 5, scope: !61)
!78 = !DILocation(line: 116, column: 5, scope: !61)
!79 = !DILocation(line: 117, column: 5, scope: !61)
!80 = !DILocation(line: 119, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 64, type: !4)
!83 = !DILocation(line: 64, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !16, line: 65, type: !4)
!85 = !DILocation(line: 65, column: 15, scope: !81)
!86 = !DILocation(line: 65, column: 42, scope: !81)
!87 = !DILocation(line: 65, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !16, line: 66, type: !4)
!89 = !DILocation(line: 66, column: 15, scope: !81)
!90 = !DILocation(line: 66, column: 43, scope: !81)
!91 = !DILocation(line: 66, column: 32, scope: !81)
!92 = !DILocation(line: 67, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !16, line: 67, column: 8)
!94 = !DILocation(line: 67, column: 8, scope: !81)
!95 = !DILocation(line: 71, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !16, line: 68, column: 5)
!97 = !DILocation(line: 71, column: 14, scope: !96)
!98 = !DILocation(line: 72, column: 9, scope: !96)
!99 = !DILocation(line: 72, column: 17, scope: !96)
!100 = !DILocation(line: 73, column: 5, scope: !96)
!101 = !DILocation(line: 78, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !93, file: !16, line: 75, column: 5)
!103 = !DILocation(line: 78, column: 14, scope: !102)
!104 = !DILocation(line: 79, column: 9, scope: !102)
!105 = !DILocation(line: 79, column: 17, scope: !102)
!106 = !DILocalVariable(name: "source", scope: !107, file: !16, line: 82, type: !45)
!107 = distinct !DILexicalBlock(scope: !81, file: !16, line: 81, column: 5)
!108 = !DILocation(line: 82, column: 17, scope: !107)
!109 = !DILocation(line: 85, column: 16, scope: !107)
!110 = !DILocation(line: 85, column: 9, scope: !107)
!111 = !DILocation(line: 85, column: 38, scope: !107)
!112 = !DILocation(line: 85, column: 31, scope: !107)
!113 = !DILocation(line: 85, column: 46, scope: !107)
!114 = !DILocation(line: 85, column: 51, scope: !107)
!115 = !DILocation(line: 86, column: 20, scope: !107)
!116 = !DILocation(line: 86, column: 9, scope: !107)
!117 = !DILocation(line: 88, column: 1, scope: !81)
