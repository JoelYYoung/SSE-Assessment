; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %5, i32** %data, align 8, !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !50
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx1, align 4, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !56
  %cmp2 = icmp ult i64 %7, 100, !dbg !58
  br i1 %cmp2, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !62
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !62
  %10 = load i32*, i32** %data, align 8, !dbg !63
  %11 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !63
  store i32 %9, i32* %arrayidx4, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %12, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !72
  store i32 0, i32* %arrayidx5, align 4, !dbg !73
  %14 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %14), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #4, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #4, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 200, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %2 = alloca i8, i64 400, align 16, !dbg !110
  %3 = bitcast i8* %2 to i32*, !dbg !111
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !109
  %4 = load i32, i32* @globalFive, align 4, !dbg !112
  %cmp = icmp ne i32 %4, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !119
  store i32* %5, i32** %data, align 8, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !130
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx1, align 4, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !136
  %cmp2 = icmp ult i64 %7, 100, !dbg !138
  br i1 %cmp2, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !142
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !142
  %10 = load i32*, i32** %data, align 8, !dbg !143
  %11 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !143
  store i32 %9, i32* %arrayidx4, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %12, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !151
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !151
  store i32 0, i32* %arrayidx5, align 4, !dbg !152
  %14 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %14), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 200, align 16, !dbg !161
  %1 = bitcast i8* %0 to i32*, !dbg !162
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !160
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %2 = alloca i8, i64 400, align 16, !dbg !165
  %3 = bitcast i8* %2 to i32*, !dbg !166
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !164
  %4 = load i32, i32* @globalFive, align 4, !dbg !167
  %cmp = icmp eq i32 %4, 5, !dbg !169
  br i1 %cmp, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !171
  store i32* %5, i32** %data, align 8, !dbg !173
  %6 = load i32*, i32** %data, align 8, !dbg !174
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !174
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !180, metadata !DIExpression()), !dbg !181
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !182
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !183
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !184
  store i32 0, i32* %arrayidx1, align 4, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !189
  %cmp2 = icmp ult i64 %7, 100, !dbg !191
  br i1 %cmp2, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !195
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !195
  %10 = load i32*, i32** %data, align 8, !dbg !196
  %11 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !196
  store i32 %9, i32* %arrayidx4, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %12, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !204
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !204
  store i32 0, i32* %arrayidx5, align 4, !dbg !205
  %14 = load i32*, i32** %data, align 8, !dbg !206
  call void @printWLine(i32* %14), !dbg !207
  ret void, !dbg !208
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 18, scope: !30)
!32 = !DILocation(line: 28, column: 8, scope: !15)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !16, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 36, column: 16, scope: !40)
!44 = !DILocalVariable(name: "source", scope: !40, file: !16, line: 37, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 37, column: 17, scope: !40)
!49 = !DILocation(line: 38, column: 17, scope: !40)
!50 = !DILocation(line: 38, column: 9, scope: !40)
!51 = !DILocation(line: 39, column: 9, scope: !40)
!52 = !DILocation(line: 39, column: 23, scope: !40)
!53 = !DILocation(line: 41, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !40, file: !16, line: 41, column: 9)
!55 = !DILocation(line: 41, column: 14, scope: !54)
!56 = !DILocation(line: 41, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !16, line: 41, column: 9)
!58 = !DILocation(line: 41, column: 23, scope: !57)
!59 = !DILocation(line: 41, column: 9, scope: !54)
!60 = !DILocation(line: 43, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !16, line: 42, column: 9)
!62 = !DILocation(line: 43, column: 23, scope: !61)
!63 = !DILocation(line: 43, column: 13, scope: !61)
!64 = !DILocation(line: 43, column: 18, scope: !61)
!65 = !DILocation(line: 43, column: 21, scope: !61)
!66 = !DILocation(line: 44, column: 9, scope: !61)
!67 = !DILocation(line: 41, column: 31, scope: !57)
!68 = !DILocation(line: 41, column: 9, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 44, column: 9, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 45, column: 9, scope: !40)
!73 = !DILocation(line: 45, column: 21, scope: !40)
!74 = !DILocation(line: 46, column: 20, scope: !40)
!75 = !DILocation(line: 46, column: 9, scope: !40)
!76 = !DILocation(line: 48, column: 1, scope: !15)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_14_good", scope: !16, file: !16, line: 113, type: !17, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 115, column: 5, scope: !77)
!79 = !DILocation(line: 116, column: 5, scope: !77)
!80 = !DILocation(line: 117, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 129, type: !82, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !16, line: 129, type: !7)
!88 = !DILocation(line: 129, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !16, line: 129, type: !84)
!90 = !DILocation(line: 129, column: 27, scope: !81)
!91 = !DILocation(line: 132, column: 22, scope: !81)
!92 = !DILocation(line: 132, column: 12, scope: !81)
!93 = !DILocation(line: 132, column: 5, scope: !81)
!94 = !DILocation(line: 134, column: 5, scope: !81)
!95 = !DILocation(line: 135, column: 5, scope: !81)
!96 = !DILocation(line: 136, column: 5, scope: !81)
!97 = !DILocation(line: 139, column: 5, scope: !81)
!98 = !DILocation(line: 140, column: 5, scope: !81)
!99 = !DILocation(line: 141, column: 5, scope: !81)
!100 = !DILocation(line: 143, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 57, type: !4)
!103 = !DILocation(line: 57, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !16, line: 58, type: !4)
!105 = !DILocation(line: 58, column: 15, scope: !101)
!106 = !DILocation(line: 58, column: 42, scope: !101)
!107 = !DILocation(line: 58, column: 31, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !16, line: 59, type: !4)
!109 = !DILocation(line: 59, column: 15, scope: !101)
!110 = !DILocation(line: 59, column: 43, scope: !101)
!111 = !DILocation(line: 59, column: 32, scope: !101)
!112 = !DILocation(line: 60, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !16, line: 60, column: 8)
!114 = !DILocation(line: 60, column: 18, scope: !113)
!115 = !DILocation(line: 60, column: 8, scope: !101)
!116 = !DILocation(line: 63, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !16, line: 61, column: 5)
!118 = !DILocation(line: 64, column: 5, scope: !117)
!119 = !DILocation(line: 68, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !16, line: 66, column: 5)
!121 = !DILocation(line: 68, column: 14, scope: !120)
!122 = !DILocation(line: 69, column: 9, scope: !120)
!123 = !DILocation(line: 69, column: 17, scope: !120)
!124 = !DILocalVariable(name: "i", scope: !125, file: !16, line: 72, type: !41)
!125 = distinct !DILexicalBlock(scope: !101, file: !16, line: 71, column: 5)
!126 = !DILocation(line: 72, column: 16, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !125, file: !16, line: 73, type: !45)
!128 = !DILocation(line: 73, column: 17, scope: !125)
!129 = !DILocation(line: 74, column: 17, scope: !125)
!130 = !DILocation(line: 74, column: 9, scope: !125)
!131 = !DILocation(line: 75, column: 9, scope: !125)
!132 = !DILocation(line: 75, column: 23, scope: !125)
!133 = !DILocation(line: 77, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !16, line: 77, column: 9)
!135 = !DILocation(line: 77, column: 14, scope: !134)
!136 = !DILocation(line: 77, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !16, line: 77, column: 9)
!138 = !DILocation(line: 77, column: 23, scope: !137)
!139 = !DILocation(line: 77, column: 9, scope: !134)
!140 = !DILocation(line: 79, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !16, line: 78, column: 9)
!142 = !DILocation(line: 79, column: 23, scope: !141)
!143 = !DILocation(line: 79, column: 13, scope: !141)
!144 = !DILocation(line: 79, column: 18, scope: !141)
!145 = !DILocation(line: 79, column: 21, scope: !141)
!146 = !DILocation(line: 80, column: 9, scope: !141)
!147 = !DILocation(line: 77, column: 31, scope: !137)
!148 = !DILocation(line: 77, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !71}
!150 = !DILocation(line: 80, column: 9, scope: !134)
!151 = !DILocation(line: 81, column: 9, scope: !125)
!152 = !DILocation(line: 81, column: 21, scope: !125)
!153 = !DILocation(line: 82, column: 20, scope: !125)
!154 = !DILocation(line: 82, column: 9, scope: !125)
!155 = !DILocation(line: 84, column: 1, scope: !101)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !16, line: 89, type: !4)
!158 = !DILocation(line: 89, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !16, line: 90, type: !4)
!160 = !DILocation(line: 90, column: 15, scope: !156)
!161 = !DILocation(line: 90, column: 42, scope: !156)
!162 = !DILocation(line: 90, column: 31, scope: !156)
!163 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !16, line: 91, type: !4)
!164 = !DILocation(line: 91, column: 15, scope: !156)
!165 = !DILocation(line: 91, column: 43, scope: !156)
!166 = !DILocation(line: 91, column: 32, scope: !156)
!167 = !DILocation(line: 92, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !156, file: !16, line: 92, column: 8)
!169 = !DILocation(line: 92, column: 18, scope: !168)
!170 = !DILocation(line: 92, column: 8, scope: !156)
!171 = !DILocation(line: 95, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !16, line: 93, column: 5)
!173 = !DILocation(line: 95, column: 14, scope: !172)
!174 = !DILocation(line: 96, column: 9, scope: !172)
!175 = !DILocation(line: 96, column: 17, scope: !172)
!176 = !DILocation(line: 97, column: 5, scope: !172)
!177 = !DILocalVariable(name: "i", scope: !178, file: !16, line: 99, type: !41)
!178 = distinct !DILexicalBlock(scope: !156, file: !16, line: 98, column: 5)
!179 = !DILocation(line: 99, column: 16, scope: !178)
!180 = !DILocalVariable(name: "source", scope: !178, file: !16, line: 100, type: !45)
!181 = !DILocation(line: 100, column: 17, scope: !178)
!182 = !DILocation(line: 101, column: 17, scope: !178)
!183 = !DILocation(line: 101, column: 9, scope: !178)
!184 = !DILocation(line: 102, column: 9, scope: !178)
!185 = !DILocation(line: 102, column: 23, scope: !178)
!186 = !DILocation(line: 104, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !178, file: !16, line: 104, column: 9)
!188 = !DILocation(line: 104, column: 14, scope: !187)
!189 = !DILocation(line: 104, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !16, line: 104, column: 9)
!191 = !DILocation(line: 104, column: 23, scope: !190)
!192 = !DILocation(line: 104, column: 9, scope: !187)
!193 = !DILocation(line: 106, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !16, line: 105, column: 9)
!195 = !DILocation(line: 106, column: 23, scope: !194)
!196 = !DILocation(line: 106, column: 13, scope: !194)
!197 = !DILocation(line: 106, column: 18, scope: !194)
!198 = !DILocation(line: 106, column: 21, scope: !194)
!199 = !DILocation(line: 107, column: 9, scope: !194)
!200 = !DILocation(line: 104, column: 31, scope: !190)
!201 = !DILocation(line: 104, column: 9, scope: !190)
!202 = distinct !{!202, !192, !203, !71}
!203 = !DILocation(line: 107, column: 9, scope: !187)
!204 = !DILocation(line: 108, column: 9, scope: !178)
!205 = !DILocation(line: 108, column: 21, scope: !178)
!206 = !DILocation(line: 109, column: 20, scope: !178)
!207 = !DILocation(line: 109, column: 9, scope: !178)
!208 = !DILocation(line: 111, column: 1, scope: !156)
