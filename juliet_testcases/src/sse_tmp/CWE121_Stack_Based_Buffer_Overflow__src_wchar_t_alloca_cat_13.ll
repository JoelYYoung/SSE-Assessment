; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp = icmp eq i32 %3, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %7) #5, !dbg !45
  %8 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %8), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 400, align 16, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !79
  store i32* %1, i32** %dataBuffer, align 8, !dbg !77
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  store i32* %2, i32** %data, align 8, !dbg !81
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !82
  %cmp = icmp ne i32 %3, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !89
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %7) #5, !dbg !99
  %8 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* %8), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 400, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBuffer, align 8, !dbg !107
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  store i32* %2, i32** %data, align 8, !dbg !111
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !112
  %cmp = icmp eq i32 %3, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !116
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !124
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !125
  %7 = load i32*, i32** %data, align 8, !dbg !126
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %7) #5, !dbg !127
  %8 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* %8), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 25, scope: !28)
!30 = !DILocation(line: 28, column: 8, scope: !15)
!31 = !DILocation(line: 31, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !16, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !16, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocation(line: 37, column: 16, scope: !38)
!44 = !DILocation(line: 37, column: 22, scope: !38)
!45 = !DILocation(line: 37, column: 9, scope: !38)
!46 = !DILocation(line: 38, column: 20, scope: !38)
!47 = !DILocation(line: 38, column: 9, scope: !38)
!48 = !DILocation(line: 40, column: 1, scope: !15)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_13_good", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 93, column: 5, scope: !49)
!51 = !DILocation(line: 94, column: 5, scope: !49)
!52 = !DILocation(line: 95, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 107, type: !54, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!7, !7, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !16, line: 107, type: !7)
!60 = !DILocation(line: 107, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !16, line: 107, type: !56)
!62 = !DILocation(line: 107, column: 27, scope: !53)
!63 = !DILocation(line: 110, column: 22, scope: !53)
!64 = !DILocation(line: 110, column: 12, scope: !53)
!65 = !DILocation(line: 110, column: 5, scope: !53)
!66 = !DILocation(line: 112, column: 5, scope: !53)
!67 = !DILocation(line: 113, column: 5, scope: !53)
!68 = !DILocation(line: 114, column: 5, scope: !53)
!69 = !DILocation(line: 117, column: 5, scope: !53)
!70 = !DILocation(line: 118, column: 5, scope: !53)
!71 = !DILocation(line: 119, column: 5, scope: !53)
!72 = !DILocation(line: 121, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !16, line: 49, type: !4)
!75 = !DILocation(line: 49, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !16, line: 50, type: !4)
!77 = !DILocation(line: 50, column: 15, scope: !73)
!78 = !DILocation(line: 50, column: 39, scope: !73)
!79 = !DILocation(line: 50, column: 28, scope: !73)
!80 = !DILocation(line: 51, column: 12, scope: !73)
!81 = !DILocation(line: 51, column: 10, scope: !73)
!82 = !DILocation(line: 52, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !16, line: 52, column: 8)
!84 = !DILocation(line: 52, column: 25, scope: !83)
!85 = !DILocation(line: 52, column: 8, scope: !73)
!86 = !DILocation(line: 55, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !16, line: 53, column: 5)
!88 = !DILocation(line: 56, column: 5, scope: !87)
!89 = !DILocation(line: 60, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !16, line: 58, column: 5)
!91 = !DILocation(line: 60, column: 9, scope: !90)
!92 = !DILocation(line: 61, column: 9, scope: !90)
!93 = !DILocation(line: 61, column: 20, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !16, line: 64, type: !39)
!95 = distinct !DILexicalBlock(scope: !73, file: !16, line: 63, column: 5)
!96 = !DILocation(line: 64, column: 17, scope: !95)
!97 = !DILocation(line: 66, column: 16, scope: !95)
!98 = !DILocation(line: 66, column: 22, scope: !95)
!99 = !DILocation(line: 66, column: 9, scope: !95)
!100 = !DILocation(line: 67, column: 20, scope: !95)
!101 = !DILocation(line: 67, column: 9, scope: !95)
!102 = !DILocation(line: 69, column: 1, scope: !73)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 72, type: !17, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !16, line: 74, type: !4)
!105 = !DILocation(line: 74, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !16, line: 75, type: !4)
!107 = !DILocation(line: 75, column: 15, scope: !103)
!108 = !DILocation(line: 75, column: 39, scope: !103)
!109 = !DILocation(line: 75, column: 28, scope: !103)
!110 = !DILocation(line: 76, column: 12, scope: !103)
!111 = !DILocation(line: 76, column: 10, scope: !103)
!112 = !DILocation(line: 77, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !103, file: !16, line: 77, column: 8)
!114 = !DILocation(line: 77, column: 25, scope: !113)
!115 = !DILocation(line: 77, column: 8, scope: !103)
!116 = !DILocation(line: 80, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !16, line: 78, column: 5)
!118 = !DILocation(line: 80, column: 9, scope: !117)
!119 = !DILocation(line: 81, column: 9, scope: !117)
!120 = !DILocation(line: 81, column: 20, scope: !117)
!121 = !DILocation(line: 82, column: 5, scope: !117)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !16, line: 84, type: !39)
!123 = distinct !DILexicalBlock(scope: !103, file: !16, line: 83, column: 5)
!124 = !DILocation(line: 84, column: 17, scope: !123)
!125 = !DILocation(line: 86, column: 16, scope: !123)
!126 = !DILocation(line: 86, column: 22, scope: !123)
!127 = !DILocation(line: 86, column: 9, scope: !123)
!128 = !DILocation(line: 87, column: 20, scope: !123)
!129 = !DILocation(line: 87, column: 9, scope: !123)
!130 = !DILocation(line: 89, column: 1, scope: !103)
