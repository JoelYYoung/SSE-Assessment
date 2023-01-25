; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !53
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx1, align 4, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !59
  %cmp2 = icmp ult i64 %7, 100, !dbg !61
  br i1 %cmp2, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !65
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !65
  %10 = load i32*, i32** %data, align 8, !dbg !66
  %11 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !66
  store i32 %9, i32* %arrayidx4, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %12, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !75
  store i32 0, i32* %arrayidx5, align 4, !dbg !76
  %14 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %14), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #4, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #4, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 200, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 400, align 16, !dbg !113
  %3 = bitcast i8* %2 to i32*, !dbg !114
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i32, i32* @staticFive, align 4, !dbg !115
  %cmp = icmp ne i32 %4, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  store i32* %5, i32** %data, align 8, !dbg !124
  %6 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !133
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx1, align 4, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !139
  %cmp2 = icmp ult i64 %7, 100, !dbg !141
  br i1 %cmp2, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !145
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !145
  %10 = load i32*, i32** %data, align 8, !dbg !146
  %11 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !146
  store i32 %9, i32* %arrayidx4, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %12, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !154
  store i32 0, i32* %arrayidx5, align 4, !dbg !155
  %14 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* %14), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = alloca i8, i64 200, align 16, !dbg !164
  %1 = bitcast i8* %0 to i32*, !dbg !165
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !166, metadata !DIExpression()), !dbg !167
  %2 = alloca i8, i64 400, align 16, !dbg !168
  %3 = bitcast i8* %2 to i32*, !dbg !169
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !167
  %4 = load i32, i32* @staticFive, align 4, !dbg !170
  %cmp = icmp eq i32 %4, 5, !dbg !172
  br i1 %cmp, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !174
  store i32* %5, i32** %data, align 8, !dbg !176
  %6 = load i32*, i32** %data, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !177
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  br label %if.end, !dbg !179

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !183, metadata !DIExpression()), !dbg !184
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !185
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !186
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !187
  store i32 0, i32* %arrayidx1, align 4, !dbg !188
  store i64 0, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !192
  %cmp2 = icmp ult i64 %7, 100, !dbg !194
  br i1 %cmp2, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !198
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !198
  %10 = load i32*, i32** %data, align 8, !dbg !199
  %11 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !199
  store i32 %9, i32* %arrayidx4, align 4, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !203
  %inc = add i64 %12, 1, !dbg !203
  store i64 %inc, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !207
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !207
  store i32 0, i32* %arrayidx5, align 4, !dbg !208
  %14 = load i32*, i32** %data, align 8, !dbg !209
  call void @printWLine(i32* %14), !dbg !210
  ret void, !dbg !211
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 42, scope: !19)
!27 = !DILocation(line: 32, column: 31, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 33, type: !6)
!29 = !DILocation(line: 33, column: 15, scope: !19)
!30 = !DILocation(line: 33, column: 43, scope: !19)
!31 = !DILocation(line: 33, column: 32, scope: !19)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 8, scope: !19)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 35, column: 5)
!38 = !DILocation(line: 38, column: 14, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 17, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !12, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !12, line: 41, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 42, column: 16, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 43, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 43, column: 17, scope: !43)
!52 = !DILocation(line: 44, column: 17, scope: !43)
!53 = !DILocation(line: 44, column: 9, scope: !43)
!54 = !DILocation(line: 45, column: 9, scope: !43)
!55 = !DILocation(line: 45, column: 23, scope: !43)
!56 = !DILocation(line: 47, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !43, file: !12, line: 47, column: 9)
!58 = !DILocation(line: 47, column: 14, scope: !57)
!59 = !DILocation(line: 47, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 47, column: 9)
!61 = !DILocation(line: 47, column: 23, scope: !60)
!62 = !DILocation(line: 47, column: 9, scope: !57)
!63 = !DILocation(line: 49, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 48, column: 9)
!65 = !DILocation(line: 49, column: 23, scope: !64)
!66 = !DILocation(line: 49, column: 13, scope: !64)
!67 = !DILocation(line: 49, column: 18, scope: !64)
!68 = !DILocation(line: 49, column: 21, scope: !64)
!69 = !DILocation(line: 50, column: 9, scope: !64)
!70 = !DILocation(line: 47, column: 31, scope: !60)
!71 = !DILocation(line: 47, column: 9, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 50, column: 9, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 51, column: 9, scope: !43)
!76 = !DILocation(line: 51, column: 21, scope: !43)
!77 = !DILocation(line: 52, column: 20, scope: !43)
!78 = !DILocation(line: 52, column: 9, scope: !43)
!79 = !DILocation(line: 54, column: 1, scope: !19)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_07_good", scope: !12, file: !12, line: 119, type: !20, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 121, column: 5, scope: !80)
!82 = !DILocation(line: 122, column: 5, scope: !80)
!83 = !DILocation(line: 123, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !85, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!9, !9, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 135, type: !9)
!91 = !DILocation(line: 135, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 135, type: !87)
!93 = !DILocation(line: 135, column: 27, scope: !84)
!94 = !DILocation(line: 138, column: 22, scope: !84)
!95 = !DILocation(line: 138, column: 12, scope: !84)
!96 = !DILocation(line: 138, column: 5, scope: !84)
!97 = !DILocation(line: 140, column: 5, scope: !84)
!98 = !DILocation(line: 141, column: 5, scope: !84)
!99 = !DILocation(line: 142, column: 5, scope: !84)
!100 = !DILocation(line: 145, column: 5, scope: !84)
!101 = !DILocation(line: 146, column: 5, scope: !84)
!102 = !DILocation(line: 147, column: 5, scope: !84)
!103 = !DILocation(line: 149, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 63, type: !6)
!106 = !DILocation(line: 63, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 64, type: !6)
!108 = !DILocation(line: 64, column: 15, scope: !104)
!109 = !DILocation(line: 64, column: 42, scope: !104)
!110 = !DILocation(line: 64, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 65, type: !6)
!112 = !DILocation(line: 65, column: 15, scope: !104)
!113 = !DILocation(line: 65, column: 43, scope: !104)
!114 = !DILocation(line: 65, column: 32, scope: !104)
!115 = !DILocation(line: 66, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !12, line: 66, column: 8)
!117 = !DILocation(line: 66, column: 18, scope: !116)
!118 = !DILocation(line: 66, column: 8, scope: !104)
!119 = !DILocation(line: 69, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !12, line: 67, column: 5)
!121 = !DILocation(line: 70, column: 5, scope: !120)
!122 = !DILocation(line: 74, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !12, line: 72, column: 5)
!124 = !DILocation(line: 74, column: 14, scope: !123)
!125 = !DILocation(line: 75, column: 9, scope: !123)
!126 = !DILocation(line: 75, column: 17, scope: !123)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 78, type: !44)
!128 = distinct !DILexicalBlock(scope: !104, file: !12, line: 77, column: 5)
!129 = !DILocation(line: 78, column: 16, scope: !128)
!130 = !DILocalVariable(name: "source", scope: !128, file: !12, line: 79, type: !48)
!131 = !DILocation(line: 79, column: 17, scope: !128)
!132 = !DILocation(line: 80, column: 17, scope: !128)
!133 = !DILocation(line: 80, column: 9, scope: !128)
!134 = !DILocation(line: 81, column: 9, scope: !128)
!135 = !DILocation(line: 81, column: 23, scope: !128)
!136 = !DILocation(line: 83, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !12, line: 83, column: 9)
!138 = !DILocation(line: 83, column: 14, scope: !137)
!139 = !DILocation(line: 83, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 83, column: 9)
!141 = !DILocation(line: 83, column: 23, scope: !140)
!142 = !DILocation(line: 83, column: 9, scope: !137)
!143 = !DILocation(line: 85, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !12, line: 84, column: 9)
!145 = !DILocation(line: 85, column: 23, scope: !144)
!146 = !DILocation(line: 85, column: 13, scope: !144)
!147 = !DILocation(line: 85, column: 18, scope: !144)
!148 = !DILocation(line: 85, column: 21, scope: !144)
!149 = !DILocation(line: 86, column: 9, scope: !144)
!150 = !DILocation(line: 83, column: 31, scope: !140)
!151 = !DILocation(line: 83, column: 9, scope: !140)
!152 = distinct !{!152, !142, !153, !74}
!153 = !DILocation(line: 86, column: 9, scope: !137)
!154 = !DILocation(line: 87, column: 9, scope: !128)
!155 = !DILocation(line: 87, column: 21, scope: !128)
!156 = !DILocation(line: 88, column: 20, scope: !128)
!157 = !DILocation(line: 88, column: 9, scope: !128)
!158 = !DILocation(line: 90, column: 1, scope: !104)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !20, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!160 = !DILocalVariable(name: "data", scope: !159, file: !12, line: 95, type: !6)
!161 = !DILocation(line: 95, column: 15, scope: !159)
!162 = !DILocalVariable(name: "dataBadBuffer", scope: !159, file: !12, line: 96, type: !6)
!163 = !DILocation(line: 96, column: 15, scope: !159)
!164 = !DILocation(line: 96, column: 42, scope: !159)
!165 = !DILocation(line: 96, column: 31, scope: !159)
!166 = !DILocalVariable(name: "dataGoodBuffer", scope: !159, file: !12, line: 97, type: !6)
!167 = !DILocation(line: 97, column: 15, scope: !159)
!168 = !DILocation(line: 97, column: 43, scope: !159)
!169 = !DILocation(line: 97, column: 32, scope: !159)
!170 = !DILocation(line: 98, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !159, file: !12, line: 98, column: 8)
!172 = !DILocation(line: 98, column: 18, scope: !171)
!173 = !DILocation(line: 98, column: 8, scope: !159)
!174 = !DILocation(line: 101, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !12, line: 99, column: 5)
!176 = !DILocation(line: 101, column: 14, scope: !175)
!177 = !DILocation(line: 102, column: 9, scope: !175)
!178 = !DILocation(line: 102, column: 17, scope: !175)
!179 = !DILocation(line: 103, column: 5, scope: !175)
!180 = !DILocalVariable(name: "i", scope: !181, file: !12, line: 105, type: !44)
!181 = distinct !DILexicalBlock(scope: !159, file: !12, line: 104, column: 5)
!182 = !DILocation(line: 105, column: 16, scope: !181)
!183 = !DILocalVariable(name: "source", scope: !181, file: !12, line: 106, type: !48)
!184 = !DILocation(line: 106, column: 17, scope: !181)
!185 = !DILocation(line: 107, column: 17, scope: !181)
!186 = !DILocation(line: 107, column: 9, scope: !181)
!187 = !DILocation(line: 108, column: 9, scope: !181)
!188 = !DILocation(line: 108, column: 23, scope: !181)
!189 = !DILocation(line: 110, column: 16, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !12, line: 110, column: 9)
!191 = !DILocation(line: 110, column: 14, scope: !190)
!192 = !DILocation(line: 110, column: 21, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !12, line: 110, column: 9)
!194 = !DILocation(line: 110, column: 23, scope: !193)
!195 = !DILocation(line: 110, column: 9, scope: !190)
!196 = !DILocation(line: 112, column: 30, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !12, line: 111, column: 9)
!198 = !DILocation(line: 112, column: 23, scope: !197)
!199 = !DILocation(line: 112, column: 13, scope: !197)
!200 = !DILocation(line: 112, column: 18, scope: !197)
!201 = !DILocation(line: 112, column: 21, scope: !197)
!202 = !DILocation(line: 113, column: 9, scope: !197)
!203 = !DILocation(line: 110, column: 31, scope: !193)
!204 = !DILocation(line: 110, column: 9, scope: !193)
!205 = distinct !{!205, !195, !206, !74}
!206 = !DILocation(line: 113, column: 9, scope: !190)
!207 = !DILocation(line: 114, column: 9, scope: !181)
!208 = !DILocation(line: 114, column: 21, scope: !181)
!209 = !DILocation(line: 115, column: 20, scope: !181)
!210 = !DILocation(line: 115, column: 9, scope: !181)
!211 = !DILocation(line: 117, column: 1, scope: !159)
