; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %data4 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !42, metadata !DIExpression()), !dbg !44
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  %9 = load i32*, i32** %8, align 8, !dbg !46
  store i32* %9, i32** %data3, align 8, !dbg !44
  %10 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  store i32* %10, i32** %data3, align 8, !dbg !48
  %11 = load i32*, i32** %data3, align 8, !dbg !49
  %12 = load i32**, i32*** %dataPtr1, align 8, !dbg !50
  store i32* %11, i32** %12, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !52, metadata !DIExpression()), !dbg !54
  %13 = load i32**, i32*** %dataPtr2, align 8, !dbg !55
  %14 = load i32*, i32** %13, align 8, !dbg !56
  store i32* %14, i32** %data4, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !57, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !64, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !70
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !71
  store i32 0, i32* %arrayidx6, align 4, !dbg !72
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !73
  %call8 = call i64 @wcslen(i32* %arraydecay7) #6, !dbg !74
  store i64 %call8, i64* %destLen, align 8, !dbg !75
  store i64 0, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %15 = load i64, i64* %i, align 8, !dbg !79
  %16 = load i64, i64* %destLen, align 8, !dbg !81
  %cmp = icmp ult i64 %15, %16, !dbg !82
  br i1 %cmp, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %17 = load i32*, i32** %data4, align 8, !dbg !84
  %18 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx9 = getelementptr inbounds i32, i32* %17, i64 %18, !dbg !84
  %19 = load i32, i32* %arrayidx9, align 4, !dbg !84
  %20 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %20, !dbg !88
  store i32 %19, i32* %arrayidx10, align 4, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %21 = load i64, i64* %i, align 8, !dbg !91
  %inc = add i64 %21, 1, !dbg !91
  store i64 %inc, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !96
  store i32 0, i32* %arrayidx11, align 4, !dbg !97
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !98
  call void @printWLine(i32* %arraydecay12), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_loop_32_good() #0 !dbg !101 {
entry:
  call void @goodG2B(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #5, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #5, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !117
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_32_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_32_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !124 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %data4 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !127, metadata !DIExpression()), !dbg !128
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !129, metadata !DIExpression()), !dbg !130
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = alloca i8, i64 200, align 16, !dbg !133
  %1 = bitcast i8* %0 to i32*, !dbg !134
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = alloca i8, i64 400, align 16, !dbg !137
  %3 = bitcast i8* %2 to i32*, !dbg !138
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !136
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !139
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !140
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !143
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #5, !dbg !144
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !145
  store i32 0, i32* %arrayidx2, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !147, metadata !DIExpression()), !dbg !149
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !150
  %9 = load i32*, i32** %8, align 8, !dbg !151
  store i32* %9, i32** %data3, align 8, !dbg !149
  %10 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !152
  store i32* %10, i32** %data3, align 8, !dbg !153
  %11 = load i32*, i32** %data3, align 8, !dbg !154
  %12 = load i32**, i32*** %dataPtr1, align 8, !dbg !155
  store i32* %11, i32** %12, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !157, metadata !DIExpression()), !dbg !159
  %13 = load i32**, i32*** %dataPtr2, align 8, !dbg !160
  %14 = load i32*, i32** %13, align 8, !dbg !161
  store i32* %14, i32** %data4, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !169
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !170
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx6, align 4, !dbg !172
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  %call8 = call i64 @wcslen(i32* %arraydecay7) #6, !dbg !174
  store i64 %call8, i64* %destLen, align 8, !dbg !175
  store i64 0, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %entry
  %15 = load i64, i64* %i, align 8, !dbg !179
  %16 = load i64, i64* %destLen, align 8, !dbg !181
  %cmp = icmp ult i64 %15, %16, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %17 = load i32*, i32** %data4, align 8, !dbg !184
  %18 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx9 = getelementptr inbounds i32, i32* %17, i64 %18, !dbg !184
  %19 = load i32, i32* %arrayidx9, align 4, !dbg !184
  %20 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %20, !dbg !188
  store i32 %19, i32* %arrayidx10, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %21 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %21, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !195
  store i32 0, i32* %arrayidx11, align 4, !dbg !196
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !197
  call void @printWLine(i32* %arraydecay12), !dbg !198
  ret void, !dbg !199
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_loop_32.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 42, scope: !15)
!29 = !DILocation(line: 28, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 29, type: !4)
!31 = !DILocation(line: 29, column: 15, scope: !15)
!32 = !DILocation(line: 29, column: 43, scope: !15)
!33 = !DILocation(line: 29, column: 32, scope: !15)
!34 = !DILocation(line: 30, column: 13, scope: !15)
!35 = !DILocation(line: 30, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 5, scope: !15)
!37 = !DILocation(line: 31, column: 25, scope: !15)
!38 = !DILocation(line: 32, column: 13, scope: !15)
!39 = !DILocation(line: 32, column: 5, scope: !15)
!40 = !DILocation(line: 33, column: 5, scope: !15)
!41 = !DILocation(line: 33, column: 27, scope: !15)
!42 = !DILocalVariable(name: "data", scope: !43, file: !16, line: 35, type: !4)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!44 = !DILocation(line: 35, column: 19, scope: !43)
!45 = !DILocation(line: 35, column: 27, scope: !43)
!46 = !DILocation(line: 35, column: 26, scope: !43)
!47 = !DILocation(line: 37, column: 16, scope: !43)
!48 = !DILocation(line: 37, column: 14, scope: !43)
!49 = !DILocation(line: 38, column: 21, scope: !43)
!50 = !DILocation(line: 38, column: 10, scope: !43)
!51 = !DILocation(line: 38, column: 19, scope: !43)
!52 = !DILocalVariable(name: "data", scope: !53, file: !16, line: 41, type: !4)
!53 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!54 = !DILocation(line: 41, column: 19, scope: !53)
!55 = !DILocation(line: 41, column: 27, scope: !53)
!56 = !DILocation(line: 41, column: 26, scope: !53)
!57 = !DILocalVariable(name: "i", scope: !58, file: !16, line: 43, type: !59)
!58 = distinct !DILexicalBlock(scope: !53, file: !16, line: 42, column: 9)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !60)
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 43, column: 20, scope: !58)
!62 = !DILocalVariable(name: "destLen", scope: !58, file: !16, line: 43, type: !59)
!63 = !DILocation(line: 43, column: 23, scope: !58)
!64 = !DILocalVariable(name: "dest", scope: !58, file: !16, line: 44, type: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 100)
!68 = !DILocation(line: 44, column: 21, scope: !58)
!69 = !DILocation(line: 45, column: 21, scope: !58)
!70 = !DILocation(line: 45, column: 13, scope: !58)
!71 = !DILocation(line: 46, column: 13, scope: !58)
!72 = !DILocation(line: 46, column: 25, scope: !58)
!73 = !DILocation(line: 47, column: 30, scope: !58)
!74 = !DILocation(line: 47, column: 23, scope: !58)
!75 = !DILocation(line: 47, column: 21, scope: !58)
!76 = !DILocation(line: 50, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !58, file: !16, line: 50, column: 13)
!78 = !DILocation(line: 50, column: 18, scope: !77)
!79 = !DILocation(line: 50, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !16, line: 50, column: 13)
!81 = !DILocation(line: 50, column: 29, scope: !80)
!82 = !DILocation(line: 50, column: 27, scope: !80)
!83 = !DILocation(line: 50, column: 13, scope: !77)
!84 = !DILocation(line: 52, column: 27, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !16, line: 51, column: 13)
!86 = !DILocation(line: 52, column: 32, scope: !85)
!87 = !DILocation(line: 52, column: 22, scope: !85)
!88 = !DILocation(line: 52, column: 17, scope: !85)
!89 = !DILocation(line: 52, column: 25, scope: !85)
!90 = !DILocation(line: 53, column: 13, scope: !85)
!91 = !DILocation(line: 50, column: 39, scope: !80)
!92 = !DILocation(line: 50, column: 13, scope: !80)
!93 = distinct !{!93, !83, !94, !95}
!94 = !DILocation(line: 53, column: 13, scope: !77)
!95 = !{!"llvm.loop.mustprogress"}
!96 = !DILocation(line: 54, column: 13, scope: !58)
!97 = !DILocation(line: 54, column: 25, scope: !58)
!98 = !DILocation(line: 55, column: 24, scope: !58)
!99 = !DILocation(line: 55, column: 13, scope: !58)
!100 = !DILocation(line: 58, column: 1, scope: !15)
!101 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_32_good", scope: !16, file: !16, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 104, column: 5, scope: !101)
!103 = !DILocation(line: 105, column: 1, scope: !101)
!104 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 116, type: !105, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!7, !7, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !16, line: 116, type: !7)
!111 = !DILocation(line: 116, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !16, line: 116, type: !107)
!113 = !DILocation(line: 116, column: 27, scope: !104)
!114 = !DILocation(line: 119, column: 22, scope: !104)
!115 = !DILocation(line: 119, column: 12, scope: !104)
!116 = !DILocation(line: 119, column: 5, scope: !104)
!117 = !DILocation(line: 121, column: 5, scope: !104)
!118 = !DILocation(line: 122, column: 5, scope: !104)
!119 = !DILocation(line: 123, column: 5, scope: !104)
!120 = !DILocation(line: 126, column: 5, scope: !104)
!121 = !DILocation(line: 127, column: 5, scope: !104)
!122 = !DILocation(line: 128, column: 5, scope: !104)
!123 = !DILocation(line: 130, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !16, line: 67, type: !4)
!126 = !DILocation(line: 67, column: 15, scope: !124)
!127 = !DILocalVariable(name: "dataPtr1", scope: !124, file: !16, line: 68, type: !22)
!128 = !DILocation(line: 68, column: 16, scope: !124)
!129 = !DILocalVariable(name: "dataPtr2", scope: !124, file: !16, line: 69, type: !22)
!130 = !DILocation(line: 69, column: 16, scope: !124)
!131 = !DILocalVariable(name: "dataBadBuffer", scope: !124, file: !16, line: 70, type: !4)
!132 = !DILocation(line: 70, column: 15, scope: !124)
!133 = !DILocation(line: 70, column: 42, scope: !124)
!134 = !DILocation(line: 70, column: 31, scope: !124)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !124, file: !16, line: 71, type: !4)
!136 = !DILocation(line: 71, column: 15, scope: !124)
!137 = !DILocation(line: 71, column: 43, scope: !124)
!138 = !DILocation(line: 71, column: 32, scope: !124)
!139 = !DILocation(line: 72, column: 13, scope: !124)
!140 = !DILocation(line: 72, column: 5, scope: !124)
!141 = !DILocation(line: 73, column: 5, scope: !124)
!142 = !DILocation(line: 73, column: 25, scope: !124)
!143 = !DILocation(line: 74, column: 13, scope: !124)
!144 = !DILocation(line: 74, column: 5, scope: !124)
!145 = !DILocation(line: 75, column: 5, scope: !124)
!146 = !DILocation(line: 75, column: 27, scope: !124)
!147 = !DILocalVariable(name: "data", scope: !148, file: !16, line: 77, type: !4)
!148 = distinct !DILexicalBlock(scope: !124, file: !16, line: 76, column: 5)
!149 = !DILocation(line: 77, column: 19, scope: !148)
!150 = !DILocation(line: 77, column: 27, scope: !148)
!151 = !DILocation(line: 77, column: 26, scope: !148)
!152 = !DILocation(line: 79, column: 16, scope: !148)
!153 = !DILocation(line: 79, column: 14, scope: !148)
!154 = !DILocation(line: 80, column: 21, scope: !148)
!155 = !DILocation(line: 80, column: 10, scope: !148)
!156 = !DILocation(line: 80, column: 19, scope: !148)
!157 = !DILocalVariable(name: "data", scope: !158, file: !16, line: 83, type: !4)
!158 = distinct !DILexicalBlock(scope: !124, file: !16, line: 82, column: 5)
!159 = !DILocation(line: 83, column: 19, scope: !158)
!160 = !DILocation(line: 83, column: 27, scope: !158)
!161 = !DILocation(line: 83, column: 26, scope: !158)
!162 = !DILocalVariable(name: "i", scope: !163, file: !16, line: 85, type: !59)
!163 = distinct !DILexicalBlock(scope: !158, file: !16, line: 84, column: 9)
!164 = !DILocation(line: 85, column: 20, scope: !163)
!165 = !DILocalVariable(name: "destLen", scope: !163, file: !16, line: 85, type: !59)
!166 = !DILocation(line: 85, column: 23, scope: !163)
!167 = !DILocalVariable(name: "dest", scope: !163, file: !16, line: 86, type: !65)
!168 = !DILocation(line: 86, column: 21, scope: !163)
!169 = !DILocation(line: 87, column: 21, scope: !163)
!170 = !DILocation(line: 87, column: 13, scope: !163)
!171 = !DILocation(line: 88, column: 13, scope: !163)
!172 = !DILocation(line: 88, column: 25, scope: !163)
!173 = !DILocation(line: 89, column: 30, scope: !163)
!174 = !DILocation(line: 89, column: 23, scope: !163)
!175 = !DILocation(line: 89, column: 21, scope: !163)
!176 = !DILocation(line: 92, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !163, file: !16, line: 92, column: 13)
!178 = !DILocation(line: 92, column: 18, scope: !177)
!179 = !DILocation(line: 92, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !16, line: 92, column: 13)
!181 = !DILocation(line: 92, column: 29, scope: !180)
!182 = !DILocation(line: 92, column: 27, scope: !180)
!183 = !DILocation(line: 92, column: 13, scope: !177)
!184 = !DILocation(line: 94, column: 27, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !16, line: 93, column: 13)
!186 = !DILocation(line: 94, column: 32, scope: !185)
!187 = !DILocation(line: 94, column: 22, scope: !185)
!188 = !DILocation(line: 94, column: 17, scope: !185)
!189 = !DILocation(line: 94, column: 25, scope: !185)
!190 = !DILocation(line: 95, column: 13, scope: !185)
!191 = !DILocation(line: 92, column: 39, scope: !180)
!192 = !DILocation(line: 92, column: 13, scope: !180)
!193 = distinct !{!193, !183, !194, !95}
!194 = !DILocation(line: 95, column: 13, scope: !177)
!195 = !DILocation(line: 96, column: 13, scope: !163)
!196 = !DILocation(line: 96, column: 25, scope: !163)
!197 = !DILocation(line: 97, column: 24, scope: !163)
!198 = !DILocation(line: 97, column: 13, scope: !163)
!199 = !DILocation(line: 100, column: 1, scope: !124)
