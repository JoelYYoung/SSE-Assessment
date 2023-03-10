; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05.c"
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
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !53
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx2, align 4, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %6, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !65
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !65
  %9 = load i32*, i32** %data, align 8, !dbg !66
  %10 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !66
  store i32 %8, i32* %arrayidx4, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %11, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !75
  store i32 0, i32* %arrayidx5, align 4, !dbg !76
  %13 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %13), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05_good() #0 !dbg !80 {
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
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05_bad(), !dbg !101
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
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 400, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBuffer, align 8, !dbg !108
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !112
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %4 = load i32, i32* @staticFalse, align 4, !dbg !115
  %tobool = icmp ne i32 %4, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  store i32* %5, i32** %data, align 8, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx2, align 4, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !136
  %cmp = icmp ult i64 %6, 100, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !142
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !142
  %9 = load i32*, i32** %data, align 8, !dbg !143
  %10 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !143
  store i32 %8, i32* %arrayidx4, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %11, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !151
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !151
  store i32 0, i32* %arrayidx5, align 4, !dbg !152
  %13 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %13), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 400, align 16, !dbg !161
  %1 = bitcast i8* %0 to i32*, !dbg !162
  store i32* %1, i32** %dataBuffer, align 8, !dbg !160
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !163
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !164
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  %4 = load i32, i32* @staticTrue, align 4, !dbg !167
  %tobool = icmp ne i32 %4, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.end, !dbg !169

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !170
  store i32* %5, i32** %data, align 8, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !177, metadata !DIExpression()), !dbg !178
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !179
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !180
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !181
  store i32 0, i32* %arrayidx2, align 4, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !186
  %cmp = icmp ult i64 %6, 100, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !192
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !192
  %9 = load i32*, i32** %data, align 8, !dbg !193
  %10 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !193
  store i32 %8, i32* %arrayidx4, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %11, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !201
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !201
  store i32 0, i32* %arrayidx5, align 4, !dbg !202
  %13 = load i32*, i32** %data, align 8, !dbg !203
  call void @printWLine(i32* %13), !dbg !204
  ret void, !dbg !205
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 39, scope: !21)
!29 = !DILocation(line: 33, column: 28, scope: !21)
!30 = !DILocation(line: 34, column: 13, scope: !21)
!31 = !DILocation(line: 34, column: 5, scope: !21)
!32 = !DILocation(line: 35, column: 5, scope: !21)
!33 = !DILocation(line: 35, column: 23, scope: !21)
!34 = !DILocation(line: 36, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 36, column: 8)
!36 = !DILocation(line: 36, column: 8, scope: !21)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 37, column: 5)
!39 = !DILocation(line: 39, column: 27, scope: !38)
!40 = !DILocation(line: 39, column: 14, scope: !38)
!41 = !DILocation(line: 40, column: 5, scope: !38)
!42 = !DILocalVariable(name: "i", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 42, column: 16, scope: !43)
!47 = !DILocalVariable(name: "source", scope: !43, file: !14, line: 43, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 43, column: 17, scope: !43)
!52 = !DILocation(line: 44, column: 17, scope: !43)
!53 = !DILocation(line: 44, column: 9, scope: !43)
!54 = !DILocation(line: 45, column: 9, scope: !43)
!55 = !DILocation(line: 45, column: 23, scope: !43)
!56 = !DILocation(line: 47, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !43, file: !14, line: 47, column: 9)
!58 = !DILocation(line: 47, column: 14, scope: !57)
!59 = !DILocation(line: 47, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !14, line: 47, column: 9)
!61 = !DILocation(line: 47, column: 23, scope: !60)
!62 = !DILocation(line: 47, column: 9, scope: !57)
!63 = !DILocation(line: 49, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !14, line: 48, column: 9)
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
!75 = !DILocation(line: 52, column: 9, scope: !43)
!76 = !DILocation(line: 52, column: 21, scope: !43)
!77 = !DILocation(line: 53, column: 20, scope: !43)
!78 = !DILocation(line: 53, column: 9, scope: !43)
!79 = !DILocation(line: 55, column: 1, scope: !21)
!80 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_05_good", scope: !14, file: !14, line: 122, type: !22, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 124, column: 5, scope: !80)
!82 = !DILocation(line: 125, column: 5, scope: !80)
!83 = !DILocation(line: 126, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 138, type: !85, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!9, !9, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !14, line: 138, type: !9)
!91 = !DILocation(line: 138, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !14, line: 138, type: !87)
!93 = !DILocation(line: 138, column: 27, scope: !84)
!94 = !DILocation(line: 141, column: 22, scope: !84)
!95 = !DILocation(line: 141, column: 12, scope: !84)
!96 = !DILocation(line: 141, column: 5, scope: !84)
!97 = !DILocation(line: 143, column: 5, scope: !84)
!98 = !DILocation(line: 144, column: 5, scope: !84)
!99 = !DILocation(line: 145, column: 5, scope: !84)
!100 = !DILocation(line: 148, column: 5, scope: !84)
!101 = !DILocation(line: 149, column: 5, scope: !84)
!102 = !DILocation(line: 150, column: 5, scope: !84)
!103 = !DILocation(line: 152, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !14, line: 64, type: !6)
!106 = !DILocation(line: 64, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBuffer", scope: !104, file: !14, line: 65, type: !6)
!108 = !DILocation(line: 65, column: 15, scope: !104)
!109 = !DILocation(line: 65, column: 39, scope: !104)
!110 = !DILocation(line: 65, column: 28, scope: !104)
!111 = !DILocation(line: 66, column: 13, scope: !104)
!112 = !DILocation(line: 66, column: 5, scope: !104)
!113 = !DILocation(line: 67, column: 5, scope: !104)
!114 = !DILocation(line: 67, column: 23, scope: !104)
!115 = !DILocation(line: 68, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !14, line: 68, column: 8)
!117 = !DILocation(line: 68, column: 8, scope: !104)
!118 = !DILocation(line: 71, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 69, column: 5)
!120 = !DILocation(line: 72, column: 5, scope: !119)
!121 = !DILocation(line: 76, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !14, line: 74, column: 5)
!123 = !DILocation(line: 76, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !14, line: 79, type: !44)
!125 = distinct !DILexicalBlock(scope: !104, file: !14, line: 78, column: 5)
!126 = !DILocation(line: 79, column: 16, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !125, file: !14, line: 80, type: !48)
!128 = !DILocation(line: 80, column: 17, scope: !125)
!129 = !DILocation(line: 81, column: 17, scope: !125)
!130 = !DILocation(line: 81, column: 9, scope: !125)
!131 = !DILocation(line: 82, column: 9, scope: !125)
!132 = !DILocation(line: 82, column: 23, scope: !125)
!133 = !DILocation(line: 84, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !14, line: 84, column: 9)
!135 = !DILocation(line: 84, column: 14, scope: !134)
!136 = !DILocation(line: 84, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !14, line: 84, column: 9)
!138 = !DILocation(line: 84, column: 23, scope: !137)
!139 = !DILocation(line: 84, column: 9, scope: !134)
!140 = !DILocation(line: 86, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !14, line: 85, column: 9)
!142 = !DILocation(line: 86, column: 23, scope: !141)
!143 = !DILocation(line: 86, column: 13, scope: !141)
!144 = !DILocation(line: 86, column: 18, scope: !141)
!145 = !DILocation(line: 86, column: 21, scope: !141)
!146 = !DILocation(line: 87, column: 9, scope: !141)
!147 = !DILocation(line: 84, column: 31, scope: !137)
!148 = !DILocation(line: 84, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !74}
!150 = !DILocation(line: 87, column: 9, scope: !134)
!151 = !DILocation(line: 89, column: 9, scope: !125)
!152 = !DILocation(line: 89, column: 21, scope: !125)
!153 = !DILocation(line: 90, column: 20, scope: !125)
!154 = !DILocation(line: 90, column: 9, scope: !125)
!155 = !DILocation(line: 92, column: 1, scope: !104)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 95, type: !22, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !14, line: 97, type: !6)
!158 = !DILocation(line: 97, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBuffer", scope: !156, file: !14, line: 98, type: !6)
!160 = !DILocation(line: 98, column: 15, scope: !156)
!161 = !DILocation(line: 98, column: 39, scope: !156)
!162 = !DILocation(line: 98, column: 28, scope: !156)
!163 = !DILocation(line: 99, column: 13, scope: !156)
!164 = !DILocation(line: 99, column: 5, scope: !156)
!165 = !DILocation(line: 100, column: 5, scope: !156)
!166 = !DILocation(line: 100, column: 23, scope: !156)
!167 = !DILocation(line: 101, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !156, file: !14, line: 101, column: 8)
!169 = !DILocation(line: 101, column: 8, scope: !156)
!170 = !DILocation(line: 104, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !14, line: 102, column: 5)
!172 = !DILocation(line: 104, column: 14, scope: !171)
!173 = !DILocation(line: 105, column: 5, scope: !171)
!174 = !DILocalVariable(name: "i", scope: !175, file: !14, line: 107, type: !44)
!175 = distinct !DILexicalBlock(scope: !156, file: !14, line: 106, column: 5)
!176 = !DILocation(line: 107, column: 16, scope: !175)
!177 = !DILocalVariable(name: "source", scope: !175, file: !14, line: 108, type: !48)
!178 = !DILocation(line: 108, column: 17, scope: !175)
!179 = !DILocation(line: 109, column: 17, scope: !175)
!180 = !DILocation(line: 109, column: 9, scope: !175)
!181 = !DILocation(line: 110, column: 9, scope: !175)
!182 = !DILocation(line: 110, column: 23, scope: !175)
!183 = !DILocation(line: 112, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !175, file: !14, line: 112, column: 9)
!185 = !DILocation(line: 112, column: 14, scope: !184)
!186 = !DILocation(line: 112, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !14, line: 112, column: 9)
!188 = !DILocation(line: 112, column: 23, scope: !187)
!189 = !DILocation(line: 112, column: 9, scope: !184)
!190 = !DILocation(line: 114, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !14, line: 113, column: 9)
!192 = !DILocation(line: 114, column: 23, scope: !191)
!193 = !DILocation(line: 114, column: 13, scope: !191)
!194 = !DILocation(line: 114, column: 18, scope: !191)
!195 = !DILocation(line: 114, column: 21, scope: !191)
!196 = !DILocation(line: 115, column: 9, scope: !191)
!197 = !DILocation(line: 112, column: 31, scope: !187)
!198 = !DILocation(line: 112, column: 9, scope: !187)
!199 = distinct !{!199, !189, !200, !74}
!200 = !DILocation(line: 115, column: 9, scope: !184)
!201 = !DILocation(line: 117, column: 9, scope: !175)
!202 = !DILocation(line: 117, column: 21, scope: !175)
!203 = !DILocation(line: 118, column: 20, scope: !175)
!204 = !DILocation(line: 118, column: 9, scope: !175)
!205 = !DILocation(line: 120, column: 1, scope: !156)
