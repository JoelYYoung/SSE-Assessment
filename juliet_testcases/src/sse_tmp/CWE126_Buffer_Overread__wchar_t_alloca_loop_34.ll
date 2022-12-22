; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 200, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 400, align 16, !dbg !34
  %3 = bitcast i8* %2 to i32*, !dbg !35
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !37
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !41
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !42
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  store i32* %8, i32** %data, align 8, !dbg !45
  %9 = load i32*, i32** %data, align 8, !dbg !46
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !47
  store i32* %9, i32** %unionFirst, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !49, metadata !DIExpression()), !dbg !51
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !52
  %10 = load i32*, i32** %unionSecond, align 8, !dbg !52
  store i32* %10, i32** %data3, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !60, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !66
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx5, align 4, !dbg !68
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !70
  store i64 %call7, i64* %destLen, align 8, !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !75
  %12 = load i64, i64* %destLen, align 8, !dbg !77
  %cmp = icmp ult i64 %11, %12, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %data3, align 8, !dbg !80
  %14 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !80
  %15 = load i32, i32* %arrayidx8, align 4, !dbg !80
  %16 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %16, !dbg !84
  store i32 %15, i32* %arrayidx9, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %17, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !92
  store i32 0, i32* %arrayidx10, align 4, !dbg !93
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  call void @printWLine(i32* %arraydecay11), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_34_good() #0 !dbg !97 {
entry:
  call void @goodG2B(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #5, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #5, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_34_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_34_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType* %myUnion, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = alloca i8, i64 200, align 16, !dbg !127
  %1 = bitcast i8* %0 to i32*, !dbg !128
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = alloca i8, i64 400, align 16, !dbg !131
  %3 = bitcast i8* %2 to i32*, !dbg !132
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !130
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !133
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !134
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !137
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !138
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !139
  store i32 0, i32* %arrayidx2, align 4, !dbg !140
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !141
  store i32* %8, i32** %data, align 8, !dbg !142
  %9 = load i32*, i32** %data, align 8, !dbg !143
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !144
  store i32* %9, i32** %unionFirst, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !146, metadata !DIExpression()), !dbg !148
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !149
  %10 = load i32*, i32** %unionSecond, align 8, !dbg !149
  store i32* %10, i32** %data3, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !158
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !159
  store i32 0, i32* %arrayidx5, align 4, !dbg !160
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  %call7 = call i64 @wcslen(i32* %arraydecay6) #6, !dbg !162
  store i64 %call7, i64* %destLen, align 8, !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !167
  %12 = load i64, i64* %destLen, align 8, !dbg !169
  %cmp = icmp ult i64 %11, %12, !dbg !170
  br i1 %cmp, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %data3, align 8, !dbg !172
  %14 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !172
  %15 = load i32, i32* %arrayidx8, align 4, !dbg !172
  %16 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %16, !dbg !176
  store i32 %15, i32* %arrayidx9, align 4, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %17, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !183
  store i32 0, i32* %arrayidx10, align 4, !dbg !184
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !185
  call void @printWLine(i32* %arraydecay11), !dbg !186
  ret void, !dbg !187
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_34.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_34.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 62, scope: !15)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 42, scope: !15)
!31 = !DILocation(line: 33, column: 31, scope: !15)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 34, type: !4)
!33 = !DILocation(line: 34, column: 15, scope: !15)
!34 = !DILocation(line: 34, column: 43, scope: !15)
!35 = !DILocation(line: 34, column: 32, scope: !15)
!36 = !DILocation(line: 35, column: 13, scope: !15)
!37 = !DILocation(line: 35, column: 5, scope: !15)
!38 = !DILocation(line: 36, column: 5, scope: !15)
!39 = !DILocation(line: 36, column: 25, scope: !15)
!40 = !DILocation(line: 37, column: 13, scope: !15)
!41 = !DILocation(line: 37, column: 5, scope: !15)
!42 = !DILocation(line: 38, column: 5, scope: !15)
!43 = !DILocation(line: 38, column: 27, scope: !15)
!44 = !DILocation(line: 40, column: 12, scope: !15)
!45 = !DILocation(line: 40, column: 10, scope: !15)
!46 = !DILocation(line: 41, column: 26, scope: !15)
!47 = !DILocation(line: 41, column: 13, scope: !15)
!48 = !DILocation(line: 41, column: 24, scope: !15)
!49 = !DILocalVariable(name: "data", scope: !50, file: !16, line: 43, type: !4)
!50 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 5)
!51 = !DILocation(line: 43, column: 19, scope: !50)
!52 = !DILocation(line: 43, column: 34, scope: !50)
!53 = !DILocalVariable(name: "i", scope: !54, file: !16, line: 45, type: !55)
!54 = distinct !DILexicalBlock(scope: !50, file: !16, line: 44, column: 9)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !56)
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 45, column: 20, scope: !54)
!58 = !DILocalVariable(name: "destLen", scope: !54, file: !16, line: 45, type: !55)
!59 = !DILocation(line: 45, column: 23, scope: !54)
!60 = !DILocalVariable(name: "dest", scope: !54, file: !16, line: 46, type: !61)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 100)
!64 = !DILocation(line: 46, column: 21, scope: !54)
!65 = !DILocation(line: 47, column: 21, scope: !54)
!66 = !DILocation(line: 47, column: 13, scope: !54)
!67 = !DILocation(line: 48, column: 13, scope: !54)
!68 = !DILocation(line: 48, column: 25, scope: !54)
!69 = !DILocation(line: 49, column: 30, scope: !54)
!70 = !DILocation(line: 49, column: 23, scope: !54)
!71 = !DILocation(line: 49, column: 21, scope: !54)
!72 = !DILocation(line: 52, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !54, file: !16, line: 52, column: 13)
!74 = !DILocation(line: 52, column: 18, scope: !73)
!75 = !DILocation(line: 52, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !16, line: 52, column: 13)
!77 = !DILocation(line: 52, column: 29, scope: !76)
!78 = !DILocation(line: 52, column: 27, scope: !76)
!79 = !DILocation(line: 52, column: 13, scope: !73)
!80 = !DILocation(line: 54, column: 27, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !16, line: 53, column: 13)
!82 = !DILocation(line: 54, column: 32, scope: !81)
!83 = !DILocation(line: 54, column: 22, scope: !81)
!84 = !DILocation(line: 54, column: 17, scope: !81)
!85 = !DILocation(line: 54, column: 25, scope: !81)
!86 = !DILocation(line: 55, column: 13, scope: !81)
!87 = !DILocation(line: 52, column: 39, scope: !76)
!88 = !DILocation(line: 52, column: 13, scope: !76)
!89 = distinct !{!89, !79, !90, !91}
!90 = !DILocation(line: 55, column: 13, scope: !73)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 56, column: 13, scope: !54)
!93 = !DILocation(line: 56, column: 25, scope: !54)
!94 = !DILocation(line: 57, column: 24, scope: !54)
!95 = !DILocation(line: 57, column: 13, scope: !54)
!96 = !DILocation(line: 60, column: 1, scope: !15)
!97 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_34_good", scope: !16, file: !16, line: 100, type: !17, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 102, column: 5, scope: !97)
!99 = !DILocation(line: 103, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 114, type: !101, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!7, !7, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !16, line: 114, type: !7)
!107 = !DILocation(line: 114, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !16, line: 114, type: !103)
!109 = !DILocation(line: 114, column: 27, scope: !100)
!110 = !DILocation(line: 117, column: 22, scope: !100)
!111 = !DILocation(line: 117, column: 12, scope: !100)
!112 = !DILocation(line: 117, column: 5, scope: !100)
!113 = !DILocation(line: 119, column: 5, scope: !100)
!114 = !DILocation(line: 120, column: 5, scope: !100)
!115 = !DILocation(line: 121, column: 5, scope: !100)
!116 = !DILocation(line: 124, column: 5, scope: !100)
!117 = !DILocation(line: 125, column: 5, scope: !100)
!118 = !DILocation(line: 126, column: 5, scope: !100)
!119 = !DILocation(line: 128, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !16, line: 69, type: !4)
!122 = !DILocation(line: 69, column: 15, scope: !120)
!123 = !DILocalVariable(name: "myUnion", scope: !120, file: !16, line: 70, type: !22)
!124 = !DILocation(line: 70, column: 62, scope: !120)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !16, line: 71, type: !4)
!126 = !DILocation(line: 71, column: 15, scope: !120)
!127 = !DILocation(line: 71, column: 42, scope: !120)
!128 = !DILocation(line: 71, column: 31, scope: !120)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !16, line: 72, type: !4)
!130 = !DILocation(line: 72, column: 15, scope: !120)
!131 = !DILocation(line: 72, column: 43, scope: !120)
!132 = !DILocation(line: 72, column: 32, scope: !120)
!133 = !DILocation(line: 73, column: 13, scope: !120)
!134 = !DILocation(line: 73, column: 5, scope: !120)
!135 = !DILocation(line: 74, column: 5, scope: !120)
!136 = !DILocation(line: 74, column: 25, scope: !120)
!137 = !DILocation(line: 75, column: 13, scope: !120)
!138 = !DILocation(line: 75, column: 5, scope: !120)
!139 = !DILocation(line: 76, column: 5, scope: !120)
!140 = !DILocation(line: 76, column: 27, scope: !120)
!141 = !DILocation(line: 78, column: 12, scope: !120)
!142 = !DILocation(line: 78, column: 10, scope: !120)
!143 = !DILocation(line: 79, column: 26, scope: !120)
!144 = !DILocation(line: 79, column: 13, scope: !120)
!145 = !DILocation(line: 79, column: 24, scope: !120)
!146 = !DILocalVariable(name: "data", scope: !147, file: !16, line: 81, type: !4)
!147 = distinct !DILexicalBlock(scope: !120, file: !16, line: 80, column: 5)
!148 = !DILocation(line: 81, column: 19, scope: !147)
!149 = !DILocation(line: 81, column: 34, scope: !147)
!150 = !DILocalVariable(name: "i", scope: !151, file: !16, line: 83, type: !55)
!151 = distinct !DILexicalBlock(scope: !147, file: !16, line: 82, column: 9)
!152 = !DILocation(line: 83, column: 20, scope: !151)
!153 = !DILocalVariable(name: "destLen", scope: !151, file: !16, line: 83, type: !55)
!154 = !DILocation(line: 83, column: 23, scope: !151)
!155 = !DILocalVariable(name: "dest", scope: !151, file: !16, line: 84, type: !61)
!156 = !DILocation(line: 84, column: 21, scope: !151)
!157 = !DILocation(line: 85, column: 21, scope: !151)
!158 = !DILocation(line: 85, column: 13, scope: !151)
!159 = !DILocation(line: 86, column: 13, scope: !151)
!160 = !DILocation(line: 86, column: 25, scope: !151)
!161 = !DILocation(line: 87, column: 30, scope: !151)
!162 = !DILocation(line: 87, column: 23, scope: !151)
!163 = !DILocation(line: 87, column: 21, scope: !151)
!164 = !DILocation(line: 90, column: 20, scope: !165)
!165 = distinct !DILexicalBlock(scope: !151, file: !16, line: 90, column: 13)
!166 = !DILocation(line: 90, column: 18, scope: !165)
!167 = !DILocation(line: 90, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !16, line: 90, column: 13)
!169 = !DILocation(line: 90, column: 29, scope: !168)
!170 = !DILocation(line: 90, column: 27, scope: !168)
!171 = !DILocation(line: 90, column: 13, scope: !165)
!172 = !DILocation(line: 92, column: 27, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !16, line: 91, column: 13)
!174 = !DILocation(line: 92, column: 32, scope: !173)
!175 = !DILocation(line: 92, column: 22, scope: !173)
!176 = !DILocation(line: 92, column: 17, scope: !173)
!177 = !DILocation(line: 92, column: 25, scope: !173)
!178 = !DILocation(line: 93, column: 13, scope: !173)
!179 = !DILocation(line: 90, column: 39, scope: !168)
!180 = !DILocation(line: 90, column: 13, scope: !168)
!181 = distinct !{!181, !171, !182, !91}
!182 = !DILocation(line: 93, column: 13, scope: !165)
!183 = !DILocation(line: 94, column: 13, scope: !151)
!184 = !DILocation(line: 94, column: 25, scope: !151)
!185 = !DILocation(line: 95, column: 24, scope: !151)
!186 = !DILocation(line: 95, column: 13, scope: !151)
!187 = !DILocation(line: 98, column: 1, scope: !120)
