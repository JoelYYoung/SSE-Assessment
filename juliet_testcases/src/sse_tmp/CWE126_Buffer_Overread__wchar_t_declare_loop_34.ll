; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data5 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !39
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !42
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx3, align 4, !dbg !45
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay4, i32** %data, align 8, !dbg !47
  %0 = load i32*, i32** %data, align 8, !dbg !48
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !49
  store i32* %0, i32** %unionFirst, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !51, metadata !DIExpression()), !dbg !53
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !54
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !54
  store i32* %1, i32** %data5, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !62, metadata !DIExpression()), !dbg !63
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !65
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx8, align 4, !dbg !67
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !69
  store i64 %call10, i64* %destLen, align 8, !dbg !70
  store i64 0, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !73

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !74
  %3 = load i64, i64* %destLen, align 8, !dbg !76
  %cmp = icmp ult i64 %2, %3, !dbg !77
  br i1 %cmp, label %for.body, label %for.end, !dbg !78

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data5, align 8, !dbg !79
  %5 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx11 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !79
  %6 = load i32, i32* %arrayidx11, align 4, !dbg !79
  %7 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !83
  store i32 %6, i32* %arrayidx12, align 4, !dbg !84
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !86
  %inc = add i64 %8, 1, !dbg !86
  store i64 %inc, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !87, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !91
  store i32 0, i32* %arrayidx13, align 4, !dbg !92
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !93
  call void @printWLine(i32* %arraydecay14), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_loop_34_good() #0 !dbg !96 {
entry:
  call void @goodG2B(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #5, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #5, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_34_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_34_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data5 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType* %myUnion, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !128
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #5, !dbg !129
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #5, !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx3, align 4, !dbg !135
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !136
  store i32* %arraydecay4, i32** %data, align 8, !dbg !137
  %0 = load i32*, i32** %data, align 8, !dbg !138
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !139
  store i32* %0, i32** %unionFirst, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !141, metadata !DIExpression()), !dbg !143
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !144
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !144
  store i32* %1, i32** %data5, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #5, !dbg !153
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx8, align 4, !dbg !155
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  %call10 = call i64 @wcslen(i32* %arraydecay9) #6, !dbg !157
  store i64 %call10, i64* %destLen, align 8, !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !162
  %3 = load i64, i64* %destLen, align 8, !dbg !164
  %cmp = icmp ult i64 %2, %3, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data5, align 8, !dbg !167
  %5 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx11 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !167
  %6 = load i32, i32* %arrayidx11, align 4, !dbg !167
  %7 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !171
  store i32 %6, i32* %arrayidx12, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %8, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx13, align 4, !dbg !179
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  call void @printWLine(i32* %arraydecay14), !dbg !181
  ret void, !dbg !182
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__wchar_t_declare_loop_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 63, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 34, column: 13, scope: !11)
!38 = !DILocation(line: 35, column: 13, scope: !11)
!39 = !DILocation(line: 35, column: 5, scope: !11)
!40 = !DILocation(line: 36, column: 5, scope: !11)
!41 = !DILocation(line: 36, column: 25, scope: !11)
!42 = !DILocation(line: 37, column: 13, scope: !11)
!43 = !DILocation(line: 37, column: 5, scope: !11)
!44 = !DILocation(line: 38, column: 5, scope: !11)
!45 = !DILocation(line: 38, column: 27, scope: !11)
!46 = !DILocation(line: 40, column: 12, scope: !11)
!47 = !DILocation(line: 40, column: 10, scope: !11)
!48 = !DILocation(line: 41, column: 26, scope: !11)
!49 = !DILocation(line: 41, column: 13, scope: !11)
!50 = !DILocation(line: 41, column: 24, scope: !11)
!51 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 43, type: !16)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!53 = !DILocation(line: 43, column: 19, scope: !52)
!54 = !DILocation(line: 43, column: 34, scope: !52)
!55 = !DILocalVariable(name: "i", scope: !56, file: !12, line: 45, type: !57)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 44, column: 9)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !58)
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 45, column: 20, scope: !56)
!60 = !DILocalVariable(name: "destLen", scope: !56, file: !12, line: 45, type: !57)
!61 = !DILocation(line: 45, column: 23, scope: !56)
!62 = !DILocalVariable(name: "dest", scope: !56, file: !12, line: 46, type: !34)
!63 = !DILocation(line: 46, column: 21, scope: !56)
!64 = !DILocation(line: 47, column: 21, scope: !56)
!65 = !DILocation(line: 47, column: 13, scope: !56)
!66 = !DILocation(line: 48, column: 13, scope: !56)
!67 = !DILocation(line: 48, column: 25, scope: !56)
!68 = !DILocation(line: 49, column: 30, scope: !56)
!69 = !DILocation(line: 49, column: 23, scope: !56)
!70 = !DILocation(line: 49, column: 21, scope: !56)
!71 = !DILocation(line: 52, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !56, file: !12, line: 52, column: 13)
!73 = !DILocation(line: 52, column: 18, scope: !72)
!74 = !DILocation(line: 52, column: 25, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 52, column: 13)
!76 = !DILocation(line: 52, column: 29, scope: !75)
!77 = !DILocation(line: 52, column: 27, scope: !75)
!78 = !DILocation(line: 52, column: 13, scope: !72)
!79 = !DILocation(line: 54, column: 27, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !12, line: 53, column: 13)
!81 = !DILocation(line: 54, column: 32, scope: !80)
!82 = !DILocation(line: 54, column: 22, scope: !80)
!83 = !DILocation(line: 54, column: 17, scope: !80)
!84 = !DILocation(line: 54, column: 25, scope: !80)
!85 = !DILocation(line: 55, column: 13, scope: !80)
!86 = !DILocation(line: 52, column: 39, scope: !75)
!87 = !DILocation(line: 52, column: 13, scope: !75)
!88 = distinct !{!88, !78, !89, !90}
!89 = !DILocation(line: 55, column: 13, scope: !72)
!90 = !{!"llvm.loop.mustprogress"}
!91 = !DILocation(line: 56, column: 13, scope: !56)
!92 = !DILocation(line: 56, column: 25, scope: !56)
!93 = !DILocation(line: 57, column: 24, scope: !56)
!94 = !DILocation(line: 57, column: 13, scope: !56)
!95 = !DILocation(line: 60, column: 1, scope: !11)
!96 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocation(line: 102, column: 5, scope: !96)
!98 = !DILocation(line: 103, column: 1, scope: !96)
!99 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 114, type: !100, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!19, !19, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !12, line: 114, type: !19)
!106 = !DILocation(line: 114, column: 14, scope: !99)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !12, line: 114, type: !102)
!108 = !DILocation(line: 114, column: 27, scope: !99)
!109 = !DILocation(line: 117, column: 22, scope: !99)
!110 = !DILocation(line: 117, column: 12, scope: !99)
!111 = !DILocation(line: 117, column: 5, scope: !99)
!112 = !DILocation(line: 119, column: 5, scope: !99)
!113 = !DILocation(line: 120, column: 5, scope: !99)
!114 = !DILocation(line: 121, column: 5, scope: !99)
!115 = !DILocation(line: 124, column: 5, scope: !99)
!116 = !DILocation(line: 125, column: 5, scope: !99)
!117 = !DILocation(line: 126, column: 5, scope: !99)
!118 = !DILocation(line: 128, column: 5, scope: !99)
!119 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 69, type: !16)
!121 = !DILocation(line: 69, column: 15, scope: !119)
!122 = !DILocalVariable(name: "myUnion", scope: !119, file: !12, line: 70, type: !22)
!123 = !DILocation(line: 70, column: 63, scope: !119)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !119, file: !12, line: 71, type: !29)
!125 = !DILocation(line: 71, column: 13, scope: !119)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !119, file: !12, line: 72, type: !34)
!127 = !DILocation(line: 72, column: 13, scope: !119)
!128 = !DILocation(line: 73, column: 13, scope: !119)
!129 = !DILocation(line: 73, column: 5, scope: !119)
!130 = !DILocation(line: 74, column: 5, scope: !119)
!131 = !DILocation(line: 74, column: 25, scope: !119)
!132 = !DILocation(line: 75, column: 13, scope: !119)
!133 = !DILocation(line: 75, column: 5, scope: !119)
!134 = !DILocation(line: 76, column: 5, scope: !119)
!135 = !DILocation(line: 76, column: 27, scope: !119)
!136 = !DILocation(line: 78, column: 12, scope: !119)
!137 = !DILocation(line: 78, column: 10, scope: !119)
!138 = !DILocation(line: 79, column: 26, scope: !119)
!139 = !DILocation(line: 79, column: 13, scope: !119)
!140 = !DILocation(line: 79, column: 24, scope: !119)
!141 = !DILocalVariable(name: "data", scope: !142, file: !12, line: 81, type: !16)
!142 = distinct !DILexicalBlock(scope: !119, file: !12, line: 80, column: 5)
!143 = !DILocation(line: 81, column: 19, scope: !142)
!144 = !DILocation(line: 81, column: 34, scope: !142)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 83, type: !57)
!146 = distinct !DILexicalBlock(scope: !142, file: !12, line: 82, column: 9)
!147 = !DILocation(line: 83, column: 20, scope: !146)
!148 = !DILocalVariable(name: "destLen", scope: !146, file: !12, line: 83, type: !57)
!149 = !DILocation(line: 83, column: 23, scope: !146)
!150 = !DILocalVariable(name: "dest", scope: !146, file: !12, line: 84, type: !34)
!151 = !DILocation(line: 84, column: 21, scope: !146)
!152 = !DILocation(line: 85, column: 21, scope: !146)
!153 = !DILocation(line: 85, column: 13, scope: !146)
!154 = !DILocation(line: 86, column: 13, scope: !146)
!155 = !DILocation(line: 86, column: 25, scope: !146)
!156 = !DILocation(line: 87, column: 30, scope: !146)
!157 = !DILocation(line: 87, column: 23, scope: !146)
!158 = !DILocation(line: 87, column: 21, scope: !146)
!159 = !DILocation(line: 90, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !146, file: !12, line: 90, column: 13)
!161 = !DILocation(line: 90, column: 18, scope: !160)
!162 = !DILocation(line: 90, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 90, column: 13)
!164 = !DILocation(line: 90, column: 29, scope: !163)
!165 = !DILocation(line: 90, column: 27, scope: !163)
!166 = !DILocation(line: 90, column: 13, scope: !160)
!167 = !DILocation(line: 92, column: 27, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !12, line: 91, column: 13)
!169 = !DILocation(line: 92, column: 32, scope: !168)
!170 = !DILocation(line: 92, column: 22, scope: !168)
!171 = !DILocation(line: 92, column: 17, scope: !168)
!172 = !DILocation(line: 92, column: 25, scope: !168)
!173 = !DILocation(line: 93, column: 13, scope: !168)
!174 = !DILocation(line: 90, column: 39, scope: !163)
!175 = !DILocation(line: 90, column: 13, scope: !163)
!176 = distinct !{!176, !166, !177, !90}
!177 = !DILocation(line: 93, column: 13, scope: !160)
!178 = !DILocation(line: 94, column: 13, scope: !146)
!179 = !DILocation(line: 94, column: 25, scope: !146)
!180 = !DILocation(line: 95, column: 24, scope: !146)
!181 = !DILocation(line: 95, column: 13, scope: !146)
!182 = !DILocation(line: 98, column: 1, scope: !119)
