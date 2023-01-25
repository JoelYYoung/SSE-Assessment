; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %5, i32** %data, align 8, !dbg !39
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !54
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx1, align 4, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %7, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !66
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !66
  %10 = load i32*, i32** %data, align 8, !dbg !67
  %11 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !67
  store i32 %9, i32* %arrayidx3, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %12, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !76
  store i32 0, i32* %arrayidx4, align 4, !dbg !77
  %14 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %14), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #4, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #4, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 200, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 400, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %4 = load i32, i32* @staticFalse, align 4, !dbg !116
  %tobool = icmp ne i32 %4, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

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
  %cmp = icmp ult i64 %7, 100, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !145
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !145
  %10 = load i32*, i32** %data, align 8, !dbg !146
  %11 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !146
  store i32 %9, i32* %arrayidx3, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %12, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !154
  store i32 0, i32* %arrayidx4, align 4, !dbg !155
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
  %4 = load i32, i32* @staticTrue, align 4, !dbg !170
  %tobool = icmp ne i32 %4, 0, !dbg !170
  br i1 %tobool, label %if.then, label %if.end, !dbg !172

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !173
  store i32* %5, i32** %data, align 8, !dbg !175
  %6 = load i32*, i32** %data, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  br label %if.end, !dbg !178

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !184
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !185
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !186
  store i32 0, i32* %arrayidx1, align 4, !dbg !187
  store i64 0, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !191
  %cmp = icmp ult i64 %7, 100, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !197
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !197
  %10 = load i32*, i32** %data, align 8, !dbg !198
  %11 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !198
  store i32 %9, i32* %arrayidx3, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %12, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !206
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !206
  store i32 0, i32* %arrayidx4, align 4, !dbg !207
  %14 = load i32*, i32** %data, align 8, !dbg !208
  call void @printWLine(i32* %14), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 42, scope: !21)
!29 = !DILocation(line: 33, column: 31, scope: !21)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !14, line: 34, type: !6)
!31 = !DILocation(line: 34, column: 15, scope: !21)
!32 = !DILocation(line: 34, column: 43, scope: !21)
!33 = !DILocation(line: 34, column: 32, scope: !21)
!34 = !DILocation(line: 35, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 35, column: 8)
!36 = !DILocation(line: 35, column: 8, scope: !21)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 36, column: 5)
!39 = !DILocation(line: 39, column: 14, scope: !38)
!40 = !DILocation(line: 40, column: 9, scope: !38)
!41 = !DILocation(line: 40, column: 17, scope: !38)
!42 = !DILocation(line: 41, column: 5, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !14, line: 43, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !14, line: 42, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 43, column: 16, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 44, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 44, column: 17, scope: !44)
!53 = !DILocation(line: 45, column: 17, scope: !44)
!54 = !DILocation(line: 45, column: 9, scope: !44)
!55 = !DILocation(line: 46, column: 9, scope: !44)
!56 = !DILocation(line: 46, column: 23, scope: !44)
!57 = !DILocation(line: 48, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !14, line: 48, column: 9)
!59 = !DILocation(line: 48, column: 14, scope: !58)
!60 = !DILocation(line: 48, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !14, line: 48, column: 9)
!62 = !DILocation(line: 48, column: 23, scope: !61)
!63 = !DILocation(line: 48, column: 9, scope: !58)
!64 = !DILocation(line: 50, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !14, line: 49, column: 9)
!66 = !DILocation(line: 50, column: 23, scope: !65)
!67 = !DILocation(line: 50, column: 13, scope: !65)
!68 = !DILocation(line: 50, column: 18, scope: !65)
!69 = !DILocation(line: 50, column: 21, scope: !65)
!70 = !DILocation(line: 51, column: 9, scope: !65)
!71 = !DILocation(line: 48, column: 31, scope: !61)
!72 = !DILocation(line: 48, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 51, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 52, column: 9, scope: !44)
!77 = !DILocation(line: 52, column: 21, scope: !44)
!78 = !DILocation(line: 53, column: 20, scope: !44)
!79 = !DILocation(line: 53, column: 9, scope: !44)
!80 = !DILocation(line: 55, column: 1, scope: !21)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_05_good", scope: !14, file: !14, line: 120, type: !22, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 122, column: 5, scope: !81)
!83 = !DILocation(line: 123, column: 5, scope: !81)
!84 = !DILocation(line: 124, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 136, type: !86, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!9, !9, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !14, line: 136, type: !9)
!92 = !DILocation(line: 136, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !14, line: 136, type: !88)
!94 = !DILocation(line: 136, column: 27, scope: !85)
!95 = !DILocation(line: 139, column: 22, scope: !85)
!96 = !DILocation(line: 139, column: 12, scope: !85)
!97 = !DILocation(line: 139, column: 5, scope: !85)
!98 = !DILocation(line: 141, column: 5, scope: !85)
!99 = !DILocation(line: 142, column: 5, scope: !85)
!100 = !DILocation(line: 143, column: 5, scope: !85)
!101 = !DILocation(line: 146, column: 5, scope: !85)
!102 = !DILocation(line: 147, column: 5, scope: !85)
!103 = !DILocation(line: 148, column: 5, scope: !85)
!104 = !DILocation(line: 150, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 64, type: !6)
!107 = !DILocation(line: 64, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !14, line: 65, type: !6)
!109 = !DILocation(line: 65, column: 15, scope: !105)
!110 = !DILocation(line: 65, column: 42, scope: !105)
!111 = !DILocation(line: 65, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !14, line: 66, type: !6)
!113 = !DILocation(line: 66, column: 15, scope: !105)
!114 = !DILocation(line: 66, column: 43, scope: !105)
!115 = !DILocation(line: 66, column: 32, scope: !105)
!116 = !DILocation(line: 67, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !14, line: 67, column: 8)
!118 = !DILocation(line: 67, column: 8, scope: !105)
!119 = !DILocation(line: 70, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !14, line: 68, column: 5)
!121 = !DILocation(line: 71, column: 5, scope: !120)
!122 = !DILocation(line: 75, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !14, line: 73, column: 5)
!124 = !DILocation(line: 75, column: 14, scope: !123)
!125 = !DILocation(line: 76, column: 9, scope: !123)
!126 = !DILocation(line: 76, column: 17, scope: !123)
!127 = !DILocalVariable(name: "i", scope: !128, file: !14, line: 79, type: !45)
!128 = distinct !DILexicalBlock(scope: !105, file: !14, line: 78, column: 5)
!129 = !DILocation(line: 79, column: 16, scope: !128)
!130 = !DILocalVariable(name: "source", scope: !128, file: !14, line: 80, type: !49)
!131 = !DILocation(line: 80, column: 17, scope: !128)
!132 = !DILocation(line: 81, column: 17, scope: !128)
!133 = !DILocation(line: 81, column: 9, scope: !128)
!134 = !DILocation(line: 82, column: 9, scope: !128)
!135 = !DILocation(line: 82, column: 23, scope: !128)
!136 = !DILocation(line: 84, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !14, line: 84, column: 9)
!138 = !DILocation(line: 84, column: 14, scope: !137)
!139 = !DILocation(line: 84, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !14, line: 84, column: 9)
!141 = !DILocation(line: 84, column: 23, scope: !140)
!142 = !DILocation(line: 84, column: 9, scope: !137)
!143 = !DILocation(line: 86, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !14, line: 85, column: 9)
!145 = !DILocation(line: 86, column: 23, scope: !144)
!146 = !DILocation(line: 86, column: 13, scope: !144)
!147 = !DILocation(line: 86, column: 18, scope: !144)
!148 = !DILocation(line: 86, column: 21, scope: !144)
!149 = !DILocation(line: 87, column: 9, scope: !144)
!150 = !DILocation(line: 84, column: 31, scope: !140)
!151 = !DILocation(line: 84, column: 9, scope: !140)
!152 = distinct !{!152, !142, !153, !75}
!153 = !DILocation(line: 87, column: 9, scope: !137)
!154 = !DILocation(line: 88, column: 9, scope: !128)
!155 = !DILocation(line: 88, column: 21, scope: !128)
!156 = !DILocation(line: 89, column: 20, scope: !128)
!157 = !DILocation(line: 89, column: 9, scope: !128)
!158 = !DILocation(line: 91, column: 1, scope: !105)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 94, type: !22, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!160 = !DILocalVariable(name: "data", scope: !159, file: !14, line: 96, type: !6)
!161 = !DILocation(line: 96, column: 15, scope: !159)
!162 = !DILocalVariable(name: "dataBadBuffer", scope: !159, file: !14, line: 97, type: !6)
!163 = !DILocation(line: 97, column: 15, scope: !159)
!164 = !DILocation(line: 97, column: 42, scope: !159)
!165 = !DILocation(line: 97, column: 31, scope: !159)
!166 = !DILocalVariable(name: "dataGoodBuffer", scope: !159, file: !14, line: 98, type: !6)
!167 = !DILocation(line: 98, column: 15, scope: !159)
!168 = !DILocation(line: 98, column: 43, scope: !159)
!169 = !DILocation(line: 98, column: 32, scope: !159)
!170 = !DILocation(line: 99, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !159, file: !14, line: 99, column: 8)
!172 = !DILocation(line: 99, column: 8, scope: !159)
!173 = !DILocation(line: 102, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !14, line: 100, column: 5)
!175 = !DILocation(line: 102, column: 14, scope: !174)
!176 = !DILocation(line: 103, column: 9, scope: !174)
!177 = !DILocation(line: 103, column: 17, scope: !174)
!178 = !DILocation(line: 104, column: 5, scope: !174)
!179 = !DILocalVariable(name: "i", scope: !180, file: !14, line: 106, type: !45)
!180 = distinct !DILexicalBlock(scope: !159, file: !14, line: 105, column: 5)
!181 = !DILocation(line: 106, column: 16, scope: !180)
!182 = !DILocalVariable(name: "source", scope: !180, file: !14, line: 107, type: !49)
!183 = !DILocation(line: 107, column: 17, scope: !180)
!184 = !DILocation(line: 108, column: 17, scope: !180)
!185 = !DILocation(line: 108, column: 9, scope: !180)
!186 = !DILocation(line: 109, column: 9, scope: !180)
!187 = !DILocation(line: 109, column: 23, scope: !180)
!188 = !DILocation(line: 111, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !180, file: !14, line: 111, column: 9)
!190 = !DILocation(line: 111, column: 14, scope: !189)
!191 = !DILocation(line: 111, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !14, line: 111, column: 9)
!193 = !DILocation(line: 111, column: 23, scope: !192)
!194 = !DILocation(line: 111, column: 9, scope: !189)
!195 = !DILocation(line: 113, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !14, line: 112, column: 9)
!197 = !DILocation(line: 113, column: 23, scope: !196)
!198 = !DILocation(line: 113, column: 13, scope: !196)
!199 = !DILocation(line: 113, column: 18, scope: !196)
!200 = !DILocation(line: 113, column: 21, scope: !196)
!201 = !DILocation(line: 114, column: 9, scope: !196)
!202 = !DILocation(line: 111, column: 31, scope: !192)
!203 = !DILocation(line: 111, column: 9, scope: !192)
!204 = distinct !{!204, !194, !205, !75}
!205 = !DILocation(line: 114, column: 9, scope: !189)
!206 = !DILocation(line: 115, column: 9, scope: !180)
!207 = !DILocation(line: 115, column: 21, scope: !180)
!208 = !DILocation(line: 116, column: 20, scope: !180)
!209 = !DILocation(line: 116, column: 9, scope: !180)
!210 = !DILocation(line: 118, column: 1, scope: !159)
