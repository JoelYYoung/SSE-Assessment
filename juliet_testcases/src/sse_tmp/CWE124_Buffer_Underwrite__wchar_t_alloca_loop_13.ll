; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !55
  %cmp3 = icmp ult i64 %6, 100, !dbg !57
  br i1 %cmp3, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !61
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !61
  %9 = load i32*, i32** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !62
  store i32 %8, i32* %arrayidx5, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %11, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !71
  store i32 0, i32* %arrayidx6, align 4, !dbg !72
  %13 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* %13), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #4, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #4, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 400, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBuffer, align 8, !dbg !104
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !108
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !111
  %cmp = icmp ne i32 %4, 5, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %5, i32** %data, align 8, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !127
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx2, align 4, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !133
  %cmp3 = icmp ult i64 %6, 100, !dbg !135
  br i1 %cmp3, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !139
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !140
  %10 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !140
  store i32 %8, i32* %arrayidx5, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %11, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !148
  store i32 0, i32* %arrayidx6, align 4, !dbg !149
  %13 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* %13), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = alloca i8, i64 400, align 16, !dbg !158
  %1 = bitcast i8* %0 to i32*, !dbg !159
  store i32* %1, i32** %dataBuffer, align 8, !dbg !157
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !160
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !161
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !162
  store i32 0, i32* %arrayidx, align 4, !dbg !163
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !164
  %cmp = icmp eq i32 %4, 5, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !168
  store i32* %5, i32** %data, align 8, !dbg !170
  br label %if.end, !dbg !171

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !172, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !177
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !178
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !179
  store i32 0, i32* %arrayidx2, align 4, !dbg !180
  store i64 0, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !184
  %cmp3 = icmp ult i64 %6, 100, !dbg !186
  br i1 %cmp3, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !190
  %8 = load i32, i32* %arrayidx4, align 4, !dbg !190
  %9 = load i32*, i32** %data, align 8, !dbg !191
  %10 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !191
  store i32 %8, i32* %arrayidx5, align 4, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !195
  %inc = add i64 %11, 1, !dbg !195
  store i64 %inc, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !199
  %arrayidx6 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !199
  store i32 0, i32* %arrayidx6, align 4, !dbg !200
  %13 = load i32*, i32** %data, align 8, !dbg !201
  call void @printWLine(i32* %13), !dbg !202
  ret void, !dbg !203
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 29, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 8)
!31 = !DILocation(line: 29, column: 25, scope: !30)
!32 = !DILocation(line: 29, column: 8, scope: !15)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 30, column: 5)
!35 = !DILocation(line: 32, column: 27, scope: !34)
!36 = !DILocation(line: 32, column: 14, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "i", scope: !39, file: !16, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 35, column: 16, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 36, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 36, column: 17, scope: !39)
!48 = !DILocation(line: 37, column: 17, scope: !39)
!49 = !DILocation(line: 37, column: 9, scope: !39)
!50 = !DILocation(line: 38, column: 9, scope: !39)
!51 = !DILocation(line: 38, column: 23, scope: !39)
!52 = !DILocation(line: 40, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !39, file: !16, line: 40, column: 9)
!54 = !DILocation(line: 40, column: 14, scope: !53)
!55 = !DILocation(line: 40, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !16, line: 40, column: 9)
!57 = !DILocation(line: 40, column: 23, scope: !56)
!58 = !DILocation(line: 40, column: 9, scope: !53)
!59 = !DILocation(line: 42, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !16, line: 41, column: 9)
!61 = !DILocation(line: 42, column: 23, scope: !60)
!62 = !DILocation(line: 42, column: 13, scope: !60)
!63 = !DILocation(line: 42, column: 18, scope: !60)
!64 = !DILocation(line: 42, column: 21, scope: !60)
!65 = !DILocation(line: 43, column: 9, scope: !60)
!66 = !DILocation(line: 40, column: 31, scope: !56)
!67 = !DILocation(line: 40, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 43, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 45, column: 9, scope: !39)
!72 = !DILocation(line: 45, column: 21, scope: !39)
!73 = !DILocation(line: 46, column: 20, scope: !39)
!74 = !DILocation(line: 46, column: 9, scope: !39)
!75 = !DILocation(line: 48, column: 1, scope: !15)
!76 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_13_good", scope: !16, file: !16, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 117, column: 5, scope: !76)
!78 = !DILocation(line: 118, column: 5, scope: !76)
!79 = !DILocation(line: 119, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 131, type: !81, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !16, line: 131, type: !7)
!87 = !DILocation(line: 131, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !16, line: 131, type: !83)
!89 = !DILocation(line: 131, column: 27, scope: !80)
!90 = !DILocation(line: 134, column: 22, scope: !80)
!91 = !DILocation(line: 134, column: 12, scope: !80)
!92 = !DILocation(line: 134, column: 5, scope: !80)
!93 = !DILocation(line: 136, column: 5, scope: !80)
!94 = !DILocation(line: 137, column: 5, scope: !80)
!95 = !DILocation(line: 138, column: 5, scope: !80)
!96 = !DILocation(line: 141, column: 5, scope: !80)
!97 = !DILocation(line: 142, column: 5, scope: !80)
!98 = !DILocation(line: 143, column: 5, scope: !80)
!99 = !DILocation(line: 145, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 57, type: !4)
!102 = !DILocation(line: 57, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !16, line: 58, type: !4)
!104 = !DILocation(line: 58, column: 15, scope: !100)
!105 = !DILocation(line: 58, column: 39, scope: !100)
!106 = !DILocation(line: 58, column: 28, scope: !100)
!107 = !DILocation(line: 59, column: 13, scope: !100)
!108 = !DILocation(line: 59, column: 5, scope: !100)
!109 = !DILocation(line: 60, column: 5, scope: !100)
!110 = !DILocation(line: 60, column: 23, scope: !100)
!111 = !DILocation(line: 61, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !100, file: !16, line: 61, column: 8)
!113 = !DILocation(line: 61, column: 25, scope: !112)
!114 = !DILocation(line: 61, column: 8, scope: !100)
!115 = !DILocation(line: 64, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !16, line: 62, column: 5)
!117 = !DILocation(line: 65, column: 5, scope: !116)
!118 = !DILocation(line: 69, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !16, line: 67, column: 5)
!120 = !DILocation(line: 69, column: 14, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !16, line: 72, type: !40)
!122 = distinct !DILexicalBlock(scope: !100, file: !16, line: 71, column: 5)
!123 = !DILocation(line: 72, column: 16, scope: !122)
!124 = !DILocalVariable(name: "source", scope: !122, file: !16, line: 73, type: !44)
!125 = !DILocation(line: 73, column: 17, scope: !122)
!126 = !DILocation(line: 74, column: 17, scope: !122)
!127 = !DILocation(line: 74, column: 9, scope: !122)
!128 = !DILocation(line: 75, column: 9, scope: !122)
!129 = !DILocation(line: 75, column: 23, scope: !122)
!130 = !DILocation(line: 77, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !122, file: !16, line: 77, column: 9)
!132 = !DILocation(line: 77, column: 14, scope: !131)
!133 = !DILocation(line: 77, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !16, line: 77, column: 9)
!135 = !DILocation(line: 77, column: 23, scope: !134)
!136 = !DILocation(line: 77, column: 9, scope: !131)
!137 = !DILocation(line: 79, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !16, line: 78, column: 9)
!139 = !DILocation(line: 79, column: 23, scope: !138)
!140 = !DILocation(line: 79, column: 13, scope: !138)
!141 = !DILocation(line: 79, column: 18, scope: !138)
!142 = !DILocation(line: 79, column: 21, scope: !138)
!143 = !DILocation(line: 80, column: 9, scope: !138)
!144 = !DILocation(line: 77, column: 31, scope: !134)
!145 = !DILocation(line: 77, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !70}
!147 = !DILocation(line: 80, column: 9, scope: !131)
!148 = !DILocation(line: 82, column: 9, scope: !122)
!149 = !DILocation(line: 82, column: 21, scope: !122)
!150 = !DILocation(line: 83, column: 20, scope: !122)
!151 = !DILocation(line: 83, column: 9, scope: !122)
!152 = !DILocation(line: 85, column: 1, scope: !100)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 88, type: !17, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !16, line: 90, type: !4)
!155 = !DILocation(line: 90, column: 15, scope: !153)
!156 = !DILocalVariable(name: "dataBuffer", scope: !153, file: !16, line: 91, type: !4)
!157 = !DILocation(line: 91, column: 15, scope: !153)
!158 = !DILocation(line: 91, column: 39, scope: !153)
!159 = !DILocation(line: 91, column: 28, scope: !153)
!160 = !DILocation(line: 92, column: 13, scope: !153)
!161 = !DILocation(line: 92, column: 5, scope: !153)
!162 = !DILocation(line: 93, column: 5, scope: !153)
!163 = !DILocation(line: 93, column: 23, scope: !153)
!164 = !DILocation(line: 94, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !153, file: !16, line: 94, column: 8)
!166 = !DILocation(line: 94, column: 25, scope: !165)
!167 = !DILocation(line: 94, column: 8, scope: !153)
!168 = !DILocation(line: 97, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !16, line: 95, column: 5)
!170 = !DILocation(line: 97, column: 14, scope: !169)
!171 = !DILocation(line: 98, column: 5, scope: !169)
!172 = !DILocalVariable(name: "i", scope: !173, file: !16, line: 100, type: !40)
!173 = distinct !DILexicalBlock(scope: !153, file: !16, line: 99, column: 5)
!174 = !DILocation(line: 100, column: 16, scope: !173)
!175 = !DILocalVariable(name: "source", scope: !173, file: !16, line: 101, type: !44)
!176 = !DILocation(line: 101, column: 17, scope: !173)
!177 = !DILocation(line: 102, column: 17, scope: !173)
!178 = !DILocation(line: 102, column: 9, scope: !173)
!179 = !DILocation(line: 103, column: 9, scope: !173)
!180 = !DILocation(line: 103, column: 23, scope: !173)
!181 = !DILocation(line: 105, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !173, file: !16, line: 105, column: 9)
!183 = !DILocation(line: 105, column: 14, scope: !182)
!184 = !DILocation(line: 105, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !16, line: 105, column: 9)
!186 = !DILocation(line: 105, column: 23, scope: !185)
!187 = !DILocation(line: 105, column: 9, scope: !182)
!188 = !DILocation(line: 107, column: 30, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !16, line: 106, column: 9)
!190 = !DILocation(line: 107, column: 23, scope: !189)
!191 = !DILocation(line: 107, column: 13, scope: !189)
!192 = !DILocation(line: 107, column: 18, scope: !189)
!193 = !DILocation(line: 107, column: 21, scope: !189)
!194 = !DILocation(line: 108, column: 9, scope: !189)
!195 = !DILocation(line: 105, column: 31, scope: !185)
!196 = !DILocation(line: 105, column: 9, scope: !185)
!197 = distinct !{!197, !187, !198, !70}
!198 = !DILocation(line: 108, column: 9, scope: !182)
!199 = !DILocation(line: 110, column: 9, scope: !173)
!200 = !DILocation(line: 110, column: 21, scope: !173)
!201 = !DILocation(line: 111, column: 20, scope: !173)
!202 = !DILocation(line: 111, column: 9, scope: !173)
!203 = !DILocation(line: 113, column: 1, scope: !153)
