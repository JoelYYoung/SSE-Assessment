; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !50
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx4, align 4, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !56
  %cmp5 = icmp ult i64 %1, 100, !dbg !58
  br i1 %cmp5, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !60
  %3 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !60
  %4 = load i32, i32* %arrayidx6, align 4, !dbg !60
  %5 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !64
  store i32 %4, i32* %arrayidx7, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %6, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !72
  store i32 0, i32* %arrayidx8, align 4, !dbg !73
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !74
  call void @printWLine(i32* %arraydecay9), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_07_good() #0 !dbg !77 {
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
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_07_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_07_bad(), !dbg !98
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
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %0 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp = icmp ne i32 %0, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !117
  store i32* %arraydecay1, i32** %data, align 8, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !126
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx4, align 4, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !132
  %cmp5 = icmp ult i64 %1, 100, !dbg !134
  br i1 %cmp5, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !136
  %3 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !136
  %4 = load i32, i32* %arrayidx6, align 4, !dbg !136
  %5 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !140
  store i32 %4, i32* %arrayidx7, align 4, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %6, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx8, align 4, !dbg !148
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  call void @printWLine(i32* %arraydecay9), !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !157
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !158
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !160
  %0 = load i32, i32* @staticFive, align 4, !dbg !161
  %cmp = icmp eq i32 %0, 5, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !165
  store i32* %arraydecay1, i32** %data, align 8, !dbg !167
  br label %if.end, !dbg !168

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !172, metadata !DIExpression()), !dbg !173
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !175
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx4, align 4, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !181
  %cmp5 = icmp ult i64 %1, 100, !dbg !183
  br i1 %cmp5, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !185
  %3 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !185
  %4 = load i32, i32* %arrayidx6, align 4, !dbg !185
  %5 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !189
  store i32 %4, i32* %arrayidx7, align 4, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %6, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !196
  store i32 0, i32* %arrayidx8, align 4, !dbg !197
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !198
  call void @printWLine(i32* %arraydecay9), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocation(line: 33, column: 13, scope: !16)
!30 = !DILocation(line: 33, column: 5, scope: !16)
!31 = !DILocation(line: 34, column: 5, scope: !16)
!32 = !DILocation(line: 34, column: 23, scope: !16)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 18, scope: !34)
!36 = !DILocation(line: 35, column: 8, scope: !16)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 27, scope: !38)
!40 = !DILocation(line: 38, column: 14, scope: !38)
!41 = !DILocation(line: 39, column: 5, scope: !38)
!42 = !DILocalVariable(name: "i", scope: !43, file: !8, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 41, column: 16, scope: !43)
!47 = !DILocalVariable(name: "dest", scope: !43, file: !8, line: 42, type: !25)
!48 = !DILocation(line: 42, column: 17, scope: !43)
!49 = !DILocation(line: 43, column: 17, scope: !43)
!50 = !DILocation(line: 43, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 9, scope: !43)
!52 = !DILocation(line: 44, column: 21, scope: !43)
!53 = !DILocation(line: 46, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !43, file: !8, line: 46, column: 9)
!55 = !DILocation(line: 46, column: 14, scope: !54)
!56 = !DILocation(line: 46, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !8, line: 46, column: 9)
!58 = !DILocation(line: 46, column: 23, scope: !57)
!59 = !DILocation(line: 46, column: 9, scope: !54)
!60 = !DILocation(line: 48, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !8, line: 47, column: 9)
!62 = !DILocation(line: 48, column: 28, scope: !61)
!63 = !DILocation(line: 48, column: 18, scope: !61)
!64 = !DILocation(line: 48, column: 13, scope: !61)
!65 = !DILocation(line: 48, column: 21, scope: !61)
!66 = !DILocation(line: 49, column: 9, scope: !61)
!67 = !DILocation(line: 46, column: 31, scope: !57)
!68 = !DILocation(line: 46, column: 9, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 49, column: 9, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 51, column: 9, scope: !43)
!73 = !DILocation(line: 51, column: 21, scope: !43)
!74 = !DILocation(line: 52, column: 20, scope: !43)
!75 = !DILocation(line: 52, column: 9, scope: !43)
!76 = !DILocation(line: 54, column: 1, scope: !16)
!77 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_07_good", scope: !8, file: !8, line: 121, type: !17, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 123, column: 5, scope: !77)
!79 = !DILocation(line: 124, column: 5, scope: !77)
!80 = !DILocation(line: 125, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 137, type: !82, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!9, !9, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !8, line: 137, type: !9)
!88 = !DILocation(line: 137, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !8, line: 137, type: !84)
!90 = !DILocation(line: 137, column: 27, scope: !81)
!91 = !DILocation(line: 140, column: 22, scope: !81)
!92 = !DILocation(line: 140, column: 12, scope: !81)
!93 = !DILocation(line: 140, column: 5, scope: !81)
!94 = !DILocation(line: 142, column: 5, scope: !81)
!95 = !DILocation(line: 143, column: 5, scope: !81)
!96 = !DILocation(line: 144, column: 5, scope: !81)
!97 = !DILocation(line: 147, column: 5, scope: !81)
!98 = !DILocation(line: 148, column: 5, scope: !81)
!99 = !DILocation(line: 149, column: 5, scope: !81)
!100 = !DILocation(line: 151, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !8, line: 63, type: !20)
!103 = !DILocation(line: 63, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !8, line: 64, type: !25)
!105 = !DILocation(line: 64, column: 13, scope: !101)
!106 = !DILocation(line: 65, column: 13, scope: !101)
!107 = !DILocation(line: 65, column: 5, scope: !101)
!108 = !DILocation(line: 66, column: 5, scope: !101)
!109 = !DILocation(line: 66, column: 23, scope: !101)
!110 = !DILocation(line: 67, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !8, line: 67, column: 8)
!112 = !DILocation(line: 67, column: 18, scope: !111)
!113 = !DILocation(line: 67, column: 8, scope: !101)
!114 = !DILocation(line: 70, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !8, line: 68, column: 5)
!116 = !DILocation(line: 71, column: 5, scope: !115)
!117 = !DILocation(line: 75, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !8, line: 73, column: 5)
!119 = !DILocation(line: 75, column: 14, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !8, line: 78, type: !44)
!121 = distinct !DILexicalBlock(scope: !101, file: !8, line: 77, column: 5)
!122 = !DILocation(line: 78, column: 16, scope: !121)
!123 = !DILocalVariable(name: "dest", scope: !121, file: !8, line: 79, type: !25)
!124 = !DILocation(line: 79, column: 17, scope: !121)
!125 = !DILocation(line: 80, column: 17, scope: !121)
!126 = !DILocation(line: 80, column: 9, scope: !121)
!127 = !DILocation(line: 81, column: 9, scope: !121)
!128 = !DILocation(line: 81, column: 21, scope: !121)
!129 = !DILocation(line: 83, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !121, file: !8, line: 83, column: 9)
!131 = !DILocation(line: 83, column: 14, scope: !130)
!132 = !DILocation(line: 83, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !8, line: 83, column: 9)
!134 = !DILocation(line: 83, column: 23, scope: !133)
!135 = !DILocation(line: 83, column: 9, scope: !130)
!136 = !DILocation(line: 85, column: 23, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !8, line: 84, column: 9)
!138 = !DILocation(line: 85, column: 28, scope: !137)
!139 = !DILocation(line: 85, column: 18, scope: !137)
!140 = !DILocation(line: 85, column: 13, scope: !137)
!141 = !DILocation(line: 85, column: 21, scope: !137)
!142 = !DILocation(line: 86, column: 9, scope: !137)
!143 = !DILocation(line: 83, column: 31, scope: !133)
!144 = !DILocation(line: 83, column: 9, scope: !133)
!145 = distinct !{!145, !135, !146, !71}
!146 = !DILocation(line: 86, column: 9, scope: !130)
!147 = !DILocation(line: 88, column: 9, scope: !121)
!148 = !DILocation(line: 88, column: 21, scope: !121)
!149 = !DILocation(line: 89, column: 20, scope: !121)
!150 = !DILocation(line: 89, column: 9, scope: !121)
!151 = !DILocation(line: 91, column: 1, scope: !101)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DILocalVariable(name: "data", scope: !152, file: !8, line: 96, type: !20)
!154 = !DILocation(line: 96, column: 15, scope: !152)
!155 = !DILocalVariable(name: "dataBuffer", scope: !152, file: !8, line: 97, type: !25)
!156 = !DILocation(line: 97, column: 13, scope: !152)
!157 = !DILocation(line: 98, column: 13, scope: !152)
!158 = !DILocation(line: 98, column: 5, scope: !152)
!159 = !DILocation(line: 99, column: 5, scope: !152)
!160 = !DILocation(line: 99, column: 23, scope: !152)
!161 = !DILocation(line: 100, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !152, file: !8, line: 100, column: 8)
!163 = !DILocation(line: 100, column: 18, scope: !162)
!164 = !DILocation(line: 100, column: 8, scope: !152)
!165 = !DILocation(line: 103, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !8, line: 101, column: 5)
!167 = !DILocation(line: 103, column: 14, scope: !166)
!168 = !DILocation(line: 104, column: 5, scope: !166)
!169 = !DILocalVariable(name: "i", scope: !170, file: !8, line: 106, type: !44)
!170 = distinct !DILexicalBlock(scope: !152, file: !8, line: 105, column: 5)
!171 = !DILocation(line: 106, column: 16, scope: !170)
!172 = !DILocalVariable(name: "dest", scope: !170, file: !8, line: 107, type: !25)
!173 = !DILocation(line: 107, column: 17, scope: !170)
!174 = !DILocation(line: 108, column: 17, scope: !170)
!175 = !DILocation(line: 108, column: 9, scope: !170)
!176 = !DILocation(line: 109, column: 9, scope: !170)
!177 = !DILocation(line: 109, column: 21, scope: !170)
!178 = !DILocation(line: 111, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !170, file: !8, line: 111, column: 9)
!180 = !DILocation(line: 111, column: 14, scope: !179)
!181 = !DILocation(line: 111, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !8, line: 111, column: 9)
!183 = !DILocation(line: 111, column: 23, scope: !182)
!184 = !DILocation(line: 111, column: 9, scope: !179)
!185 = !DILocation(line: 113, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !8, line: 112, column: 9)
!187 = !DILocation(line: 113, column: 28, scope: !186)
!188 = !DILocation(line: 113, column: 18, scope: !186)
!189 = !DILocation(line: 113, column: 13, scope: !186)
!190 = !DILocation(line: 113, column: 21, scope: !186)
!191 = !DILocation(line: 114, column: 9, scope: !186)
!192 = !DILocation(line: 111, column: 31, scope: !182)
!193 = !DILocation(line: 111, column: 9, scope: !182)
!194 = distinct !{!194, !184, !195, !71}
!195 = !DILocation(line: 114, column: 9, scope: !179)
!196 = !DILocation(line: 116, column: 9, scope: !170)
!197 = !DILocation(line: 116, column: 21, scope: !170)
!198 = !DILocation(line: 117, column: 20, scope: !170)
!199 = !DILocation(line: 117, column: 9, scope: !170)
!200 = !DILocation(line: 119, column: 1, scope: !152)
