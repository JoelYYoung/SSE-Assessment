; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx4, align 4, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %1, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !61
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !61
  %4 = load i32, i32* %arrayidx5, align 4, !dbg !61
  %5 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !65
  store i32 %4, i32* %arrayidx6, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %6, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !73
  store i32 0, i32* %arrayidx7, align 4, !dbg !74
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  call void @printWLine(i32* %arraydecay8), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_05_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #4, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #4, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_05_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_05_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !108
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %0 = load i32, i32* @staticFalse, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

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
  %cmp = icmp ult i64 %1, 100, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !136
  %3 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !136
  %4 = load i32, i32* %arrayidx5, align 4, !dbg !136
  %5 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !140
  store i32 %4, i32* %arrayidx6, align 4, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %6, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx7, align 4, !dbg !148
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  call void @printWLine(i32* %arraydecay8), !dbg !150
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !161
  %tobool = icmp ne i32 %0, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !164
  store i32* %arraydecay1, i32** %data, align 8, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !171, metadata !DIExpression()), !dbg !172
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !174
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !175
  store i32 0, i32* %arrayidx4, align 4, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !180
  %cmp = icmp ult i64 %1, 100, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !184
  %3 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !184
  %4 = load i32, i32* %arrayidx5, align 4, !dbg !184
  %5 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !188
  store i32 %4, i32* %arrayidx6, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %6, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !195
  store i32 0, i32* %arrayidx7, align 4, !dbg !196
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !197
  call void @printWLine(i32* %arraydecay8), !dbg !198
  ret void, !dbg !199
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocation(line: 34, column: 13, scope: !18)
!32 = !DILocation(line: 34, column: 5, scope: !18)
!33 = !DILocation(line: 35, column: 5, scope: !18)
!34 = !DILocation(line: 35, column: 23, scope: !18)
!35 = !DILocation(line: 36, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!37 = !DILocation(line: 36, column: 8, scope: !18)
!38 = !DILocation(line: 39, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 37, column: 5)
!40 = !DILocation(line: 39, column: 27, scope: !39)
!41 = !DILocation(line: 39, column: 14, scope: !39)
!42 = !DILocation(line: 40, column: 5, scope: !39)
!43 = !DILocalVariable(name: "i", scope: !44, file: !10, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 42, column: 16, scope: !44)
!48 = !DILocalVariable(name: "dest", scope: !44, file: !10, line: 43, type: !27)
!49 = !DILocation(line: 43, column: 17, scope: !44)
!50 = !DILocation(line: 44, column: 17, scope: !44)
!51 = !DILocation(line: 44, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 9, scope: !44)
!53 = !DILocation(line: 45, column: 21, scope: !44)
!54 = !DILocation(line: 47, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !44, file: !10, line: 47, column: 9)
!56 = !DILocation(line: 47, column: 14, scope: !55)
!57 = !DILocation(line: 47, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !10, line: 47, column: 9)
!59 = !DILocation(line: 47, column: 23, scope: !58)
!60 = !DILocation(line: 47, column: 9, scope: !55)
!61 = !DILocation(line: 49, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !10, line: 48, column: 9)
!63 = !DILocation(line: 49, column: 28, scope: !62)
!64 = !DILocation(line: 49, column: 18, scope: !62)
!65 = !DILocation(line: 49, column: 13, scope: !62)
!66 = !DILocation(line: 49, column: 21, scope: !62)
!67 = !DILocation(line: 50, column: 9, scope: !62)
!68 = !DILocation(line: 47, column: 31, scope: !58)
!69 = !DILocation(line: 47, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 50, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 52, column: 9, scope: !44)
!74 = !DILocation(line: 52, column: 21, scope: !44)
!75 = !DILocation(line: 53, column: 20, scope: !44)
!76 = !DILocation(line: 53, column: 9, scope: !44)
!77 = !DILocation(line: 55, column: 1, scope: !18)
!78 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_05_good", scope: !10, file: !10, line: 122, type: !19, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 124, column: 5, scope: !78)
!80 = !DILocation(line: 125, column: 5, scope: !78)
!81 = !DILocation(line: 126, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 138, type: !83, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!11, !11, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !10, line: 138, type: !11)
!89 = !DILocation(line: 138, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !10, line: 138, type: !85)
!91 = !DILocation(line: 138, column: 27, scope: !82)
!92 = !DILocation(line: 141, column: 22, scope: !82)
!93 = !DILocation(line: 141, column: 12, scope: !82)
!94 = !DILocation(line: 141, column: 5, scope: !82)
!95 = !DILocation(line: 143, column: 5, scope: !82)
!96 = !DILocation(line: 144, column: 5, scope: !82)
!97 = !DILocation(line: 145, column: 5, scope: !82)
!98 = !DILocation(line: 148, column: 5, scope: !82)
!99 = !DILocation(line: 149, column: 5, scope: !82)
!100 = !DILocation(line: 150, column: 5, scope: !82)
!101 = !DILocation(line: 152, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !10, line: 64, type: !22)
!104 = !DILocation(line: 64, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !10, line: 65, type: !27)
!106 = !DILocation(line: 65, column: 13, scope: !102)
!107 = !DILocation(line: 66, column: 13, scope: !102)
!108 = !DILocation(line: 66, column: 5, scope: !102)
!109 = !DILocation(line: 67, column: 5, scope: !102)
!110 = !DILocation(line: 67, column: 23, scope: !102)
!111 = !DILocation(line: 68, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !102, file: !10, line: 68, column: 8)
!113 = !DILocation(line: 68, column: 8, scope: !102)
!114 = !DILocation(line: 71, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !10, line: 69, column: 5)
!116 = !DILocation(line: 72, column: 5, scope: !115)
!117 = !DILocation(line: 76, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !10, line: 74, column: 5)
!119 = !DILocation(line: 76, column: 14, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !10, line: 79, type: !45)
!121 = distinct !DILexicalBlock(scope: !102, file: !10, line: 78, column: 5)
!122 = !DILocation(line: 79, column: 16, scope: !121)
!123 = !DILocalVariable(name: "dest", scope: !121, file: !10, line: 80, type: !27)
!124 = !DILocation(line: 80, column: 17, scope: !121)
!125 = !DILocation(line: 81, column: 17, scope: !121)
!126 = !DILocation(line: 81, column: 9, scope: !121)
!127 = !DILocation(line: 82, column: 9, scope: !121)
!128 = !DILocation(line: 82, column: 21, scope: !121)
!129 = !DILocation(line: 84, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !121, file: !10, line: 84, column: 9)
!131 = !DILocation(line: 84, column: 14, scope: !130)
!132 = !DILocation(line: 84, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !10, line: 84, column: 9)
!134 = !DILocation(line: 84, column: 23, scope: !133)
!135 = !DILocation(line: 84, column: 9, scope: !130)
!136 = !DILocation(line: 86, column: 23, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !10, line: 85, column: 9)
!138 = !DILocation(line: 86, column: 28, scope: !137)
!139 = !DILocation(line: 86, column: 18, scope: !137)
!140 = !DILocation(line: 86, column: 13, scope: !137)
!141 = !DILocation(line: 86, column: 21, scope: !137)
!142 = !DILocation(line: 87, column: 9, scope: !137)
!143 = !DILocation(line: 84, column: 31, scope: !133)
!144 = !DILocation(line: 84, column: 9, scope: !133)
!145 = distinct !{!145, !135, !146, !72}
!146 = !DILocation(line: 87, column: 9, scope: !130)
!147 = !DILocation(line: 89, column: 9, scope: !121)
!148 = !DILocation(line: 89, column: 21, scope: !121)
!149 = !DILocation(line: 90, column: 20, scope: !121)
!150 = !DILocation(line: 90, column: 9, scope: !121)
!151 = !DILocation(line: 92, column: 1, scope: !102)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 95, type: !19, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DILocalVariable(name: "data", scope: !152, file: !10, line: 97, type: !22)
!154 = !DILocation(line: 97, column: 15, scope: !152)
!155 = !DILocalVariable(name: "dataBuffer", scope: !152, file: !10, line: 98, type: !27)
!156 = !DILocation(line: 98, column: 13, scope: !152)
!157 = !DILocation(line: 99, column: 13, scope: !152)
!158 = !DILocation(line: 99, column: 5, scope: !152)
!159 = !DILocation(line: 100, column: 5, scope: !152)
!160 = !DILocation(line: 100, column: 23, scope: !152)
!161 = !DILocation(line: 101, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !152, file: !10, line: 101, column: 8)
!163 = !DILocation(line: 101, column: 8, scope: !152)
!164 = !DILocation(line: 104, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !10, line: 102, column: 5)
!166 = !DILocation(line: 104, column: 14, scope: !165)
!167 = !DILocation(line: 105, column: 5, scope: !165)
!168 = !DILocalVariable(name: "i", scope: !169, file: !10, line: 107, type: !45)
!169 = distinct !DILexicalBlock(scope: !152, file: !10, line: 106, column: 5)
!170 = !DILocation(line: 107, column: 16, scope: !169)
!171 = !DILocalVariable(name: "dest", scope: !169, file: !10, line: 108, type: !27)
!172 = !DILocation(line: 108, column: 17, scope: !169)
!173 = !DILocation(line: 109, column: 17, scope: !169)
!174 = !DILocation(line: 109, column: 9, scope: !169)
!175 = !DILocation(line: 110, column: 9, scope: !169)
!176 = !DILocation(line: 110, column: 21, scope: !169)
!177 = !DILocation(line: 112, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !10, line: 112, column: 9)
!179 = !DILocation(line: 112, column: 14, scope: !178)
!180 = !DILocation(line: 112, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !10, line: 112, column: 9)
!182 = !DILocation(line: 112, column: 23, scope: !181)
!183 = !DILocation(line: 112, column: 9, scope: !178)
!184 = !DILocation(line: 114, column: 23, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !10, line: 113, column: 9)
!186 = !DILocation(line: 114, column: 28, scope: !185)
!187 = !DILocation(line: 114, column: 18, scope: !185)
!188 = !DILocation(line: 114, column: 13, scope: !185)
!189 = !DILocation(line: 114, column: 21, scope: !185)
!190 = !DILocation(line: 115, column: 9, scope: !185)
!191 = !DILocation(line: 112, column: 31, scope: !181)
!192 = !DILocation(line: 112, column: 9, scope: !181)
!193 = distinct !{!193, !183, !194, !72}
!194 = !DILocation(line: 115, column: 9, scope: !178)
!195 = !DILocation(line: 117, column: 9, scope: !169)
!196 = !DILocation(line: 117, column: 21, scope: !169)
!197 = !DILocation(line: 118, column: 20, scope: !169)
!198 = !DILocation(line: 118, column: 9, scope: !169)
!199 = !DILocation(line: 120, column: 1, scope: !152)
