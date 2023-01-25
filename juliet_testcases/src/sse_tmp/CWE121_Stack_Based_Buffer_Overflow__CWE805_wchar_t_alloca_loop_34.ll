; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 200, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 400, align 16, !dbg !34
  %3 = bitcast i8* %2 to i32*, !dbg !35
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %6, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !46
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %7, i32** %data1, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !58
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx2, align 4, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !64
  %cmp = icmp ult i64 %8, 100, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !70
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !70
  %11 = load i32*, i32** %data1, align 8, !dbg !71
  %12 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !71
  store i32 %10, i32* %arrayidx4, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %13, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data1, align 8, !dbg !80
  %arrayidx5 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !80
  store i32 0, i32* %arrayidx5, align 4, !dbg !81
  %15 = load i32*, i32** %data1, align 8, !dbg !82
  call void @printWLine(i32* %15), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #4, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #4, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType* %myUnion, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 200, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = alloca i8, i64 400, align 16, !dbg !119
  %3 = bitcast i8* %2 to i32*, !dbg !120
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !118
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !121
  store i32* %4, i32** %data, align 8, !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %6 = load i32*, i32** %data, align 8, !dbg !125
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !126
  store i32* %6, i32** %unionFirst, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !128, metadata !DIExpression()), !dbg !130
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !131
  %7 = load i32*, i32** %unionSecond, align 8, !dbg !131
  store i32* %7, i32** %data1, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !138
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !139
  store i32 0, i32* %arrayidx2, align 4, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !144
  %cmp = icmp ult i64 %8, 100, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !150
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !150
  %11 = load i32*, i32** %data1, align 8, !dbg !151
  %12 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !151
  store i32 %10, i32* %arrayidx4, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %13, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data1, align 8, !dbg !159
  %arrayidx5 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !159
  store i32 0, i32* %arrayidx5, align 4, !dbg !160
  %15 = load i32*, i32** %data1, align 8, !dbg !161
  call void @printWLine(i32* %15), !dbg !162
  ret void, !dbg !163
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 81, scope: !15)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 42, scope: !15)
!31 = !DILocation(line: 33, column: 31, scope: !15)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!33 = !DILocation(line: 34, column: 15, scope: !15)
!34 = !DILocation(line: 34, column: 43, scope: !15)
!35 = !DILocation(line: 34, column: 32, scope: !15)
!36 = !DILocation(line: 37, column: 12, scope: !15)
!37 = !DILocation(line: 37, column: 10, scope: !15)
!38 = !DILocation(line: 38, column: 5, scope: !15)
!39 = !DILocation(line: 38, column: 13, scope: !15)
!40 = !DILocation(line: 39, column: 26, scope: !15)
!41 = !DILocation(line: 39, column: 13, scope: !15)
!42 = !DILocation(line: 39, column: 24, scope: !15)
!43 = !DILocalVariable(name: "data", scope: !44, file: !16, line: 41, type: !4)
!44 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!45 = !DILocation(line: 41, column: 19, scope: !44)
!46 = !DILocation(line: 41, column: 34, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !16, line: 43, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !16, line: 42, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 43, column: 20, scope: !48)
!52 = !DILocalVariable(name: "source", scope: !48, file: !16, line: 44, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 44, column: 21, scope: !48)
!57 = !DILocation(line: 45, column: 21, scope: !48)
!58 = !DILocation(line: 45, column: 13, scope: !48)
!59 = !DILocation(line: 46, column: 13, scope: !48)
!60 = !DILocation(line: 46, column: 27, scope: !48)
!61 = !DILocation(line: 48, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !48, file: !16, line: 48, column: 13)
!63 = !DILocation(line: 48, column: 18, scope: !62)
!64 = !DILocation(line: 48, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !16, line: 48, column: 13)
!66 = !DILocation(line: 48, column: 27, scope: !65)
!67 = !DILocation(line: 48, column: 13, scope: !62)
!68 = !DILocation(line: 50, column: 34, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !16, line: 49, column: 13)
!70 = !DILocation(line: 50, column: 27, scope: !69)
!71 = !DILocation(line: 50, column: 17, scope: !69)
!72 = !DILocation(line: 50, column: 22, scope: !69)
!73 = !DILocation(line: 50, column: 25, scope: !69)
!74 = !DILocation(line: 51, column: 13, scope: !69)
!75 = !DILocation(line: 48, column: 35, scope: !65)
!76 = !DILocation(line: 48, column: 13, scope: !65)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 51, column: 13, scope: !62)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 52, column: 13, scope: !48)
!81 = !DILocation(line: 52, column: 25, scope: !48)
!82 = !DILocation(line: 53, column: 24, scope: !48)
!83 = !DILocation(line: 53, column: 13, scope: !48)
!84 = !DILocation(line: 56, column: 1, scope: !15)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_34_good", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 93, column: 5, scope: !85)
!87 = !DILocation(line: 94, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 105, type: !89, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !16, line: 105, type: !7)
!95 = !DILocation(line: 105, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !16, line: 105, type: !91)
!97 = !DILocation(line: 105, column: 27, scope: !88)
!98 = !DILocation(line: 108, column: 22, scope: !88)
!99 = !DILocation(line: 108, column: 12, scope: !88)
!100 = !DILocation(line: 108, column: 5, scope: !88)
!101 = !DILocation(line: 110, column: 5, scope: !88)
!102 = !DILocation(line: 111, column: 5, scope: !88)
!103 = !DILocation(line: 112, column: 5, scope: !88)
!104 = !DILocation(line: 115, column: 5, scope: !88)
!105 = !DILocation(line: 116, column: 5, scope: !88)
!106 = !DILocation(line: 117, column: 5, scope: !88)
!107 = !DILocation(line: 119, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !16, line: 65, type: !4)
!110 = !DILocation(line: 65, column: 15, scope: !108)
!111 = !DILocalVariable(name: "myUnion", scope: !108, file: !16, line: 66, type: !22)
!112 = !DILocation(line: 66, column: 81, scope: !108)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !16, line: 67, type: !4)
!114 = !DILocation(line: 67, column: 15, scope: !108)
!115 = !DILocation(line: 67, column: 42, scope: !108)
!116 = !DILocation(line: 67, column: 31, scope: !108)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !16, line: 68, type: !4)
!118 = !DILocation(line: 68, column: 15, scope: !108)
!119 = !DILocation(line: 68, column: 43, scope: !108)
!120 = !DILocation(line: 68, column: 32, scope: !108)
!121 = !DILocation(line: 70, column: 12, scope: !108)
!122 = !DILocation(line: 70, column: 10, scope: !108)
!123 = !DILocation(line: 71, column: 5, scope: !108)
!124 = !DILocation(line: 71, column: 13, scope: !108)
!125 = !DILocation(line: 72, column: 26, scope: !108)
!126 = !DILocation(line: 72, column: 13, scope: !108)
!127 = !DILocation(line: 72, column: 24, scope: !108)
!128 = !DILocalVariable(name: "data", scope: !129, file: !16, line: 74, type: !4)
!129 = distinct !DILexicalBlock(scope: !108, file: !16, line: 73, column: 5)
!130 = !DILocation(line: 74, column: 19, scope: !129)
!131 = !DILocation(line: 74, column: 34, scope: !129)
!132 = !DILocalVariable(name: "i", scope: !133, file: !16, line: 76, type: !49)
!133 = distinct !DILexicalBlock(scope: !129, file: !16, line: 75, column: 9)
!134 = !DILocation(line: 76, column: 20, scope: !133)
!135 = !DILocalVariable(name: "source", scope: !133, file: !16, line: 77, type: !53)
!136 = !DILocation(line: 77, column: 21, scope: !133)
!137 = !DILocation(line: 78, column: 21, scope: !133)
!138 = !DILocation(line: 78, column: 13, scope: !133)
!139 = !DILocation(line: 79, column: 13, scope: !133)
!140 = !DILocation(line: 79, column: 27, scope: !133)
!141 = !DILocation(line: 81, column: 20, scope: !142)
!142 = distinct !DILexicalBlock(scope: !133, file: !16, line: 81, column: 13)
!143 = !DILocation(line: 81, column: 18, scope: !142)
!144 = !DILocation(line: 81, column: 25, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !16, line: 81, column: 13)
!146 = !DILocation(line: 81, column: 27, scope: !145)
!147 = !DILocation(line: 81, column: 13, scope: !142)
!148 = !DILocation(line: 83, column: 34, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !16, line: 82, column: 13)
!150 = !DILocation(line: 83, column: 27, scope: !149)
!151 = !DILocation(line: 83, column: 17, scope: !149)
!152 = !DILocation(line: 83, column: 22, scope: !149)
!153 = !DILocation(line: 83, column: 25, scope: !149)
!154 = !DILocation(line: 84, column: 13, scope: !149)
!155 = !DILocation(line: 81, column: 35, scope: !145)
!156 = !DILocation(line: 81, column: 13, scope: !145)
!157 = distinct !{!157, !147, !158, !79}
!158 = !DILocation(line: 84, column: 13, scope: !142)
!159 = !DILocation(line: 85, column: 13, scope: !133)
!160 = !DILocation(line: 85, column: 25, scope: !133)
!161 = !DILocation(line: 86, column: 24, scope: !133)
!162 = !DILocation(line: 86, column: 13, scope: !133)
!163 = !DILocation(line: 89, column: 1, scope: !108)
