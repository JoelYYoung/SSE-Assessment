; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !53
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx2, align 4, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %2, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !65
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !65
  %5 = load i32*, i32** %data, align 8, !dbg !66
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !66
  store i32 %4, i32* %arrayidx4, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %7, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !75
  store i32 0, i32* %arrayidx5, align 4, !dbg !76
  %9 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %9), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05_good() #0 !dbg !80 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05_bad(), !dbg !101
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32, i32* @staticFalse, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store i32* %arraydecay, i32** %data, align 8, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !128
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx2, align 4, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !134
  %cmp = icmp ult i64 %2, 100, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !140
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !141
  %6 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !141
  store i32 %4, i32* %arrayidx4, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %7, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !149
  store i32 0, i32* %arrayidx5, align 4, !dbg !150
  %9 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* %9), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = load i32, i32* @staticTrue, align 4, !dbg !161
  %tobool = icmp ne i32 %0, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !164
  store i32* %arraydecay, i32** %data, align 8, !dbg !166
  %1 = load i32*, i32** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !175
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !176
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !177
  store i32 0, i32* %arrayidx2, align 4, !dbg !178
  store i64 0, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !182
  %cmp = icmp ult i64 %2, 100, !dbg !184
  br i1 %cmp, label %for.body, label %for.end, !dbg !185

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !188
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !188
  %5 = load i32*, i32** %data, align 8, !dbg !189
  %6 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !189
  store i32 %4, i32* %arrayidx4, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !193
  %inc = add i64 %7, 1, !dbg !193
  store i64 %inc, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !197
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !197
  store i32 0, i32* %arrayidx5, align 4, !dbg !198
  %9 = load i32*, i32** %data, align 8, !dbg !199
  call void @printWLine(i32* %9), !dbg !200
  ret void, !dbg !201
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 13, scope: !18)
!36 = !DILocation(line: 35, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!38 = !DILocation(line: 35, column: 8, scope: !18)
!39 = !DILocation(line: 39, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 36, column: 5)
!41 = !DILocation(line: 39, column: 14, scope: !40)
!42 = !DILocation(line: 40, column: 9, scope: !40)
!43 = !DILocation(line: 40, column: 17, scope: !40)
!44 = !DILocation(line: 41, column: 5, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !10, line: 43, type: !47)
!46 = distinct !DILexicalBlock(scope: !18, file: !10, line: 42, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 43, column: 16, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !46, file: !10, line: 44, type: !32)
!51 = !DILocation(line: 44, column: 17, scope: !46)
!52 = !DILocation(line: 45, column: 17, scope: !46)
!53 = !DILocation(line: 45, column: 9, scope: !46)
!54 = !DILocation(line: 46, column: 9, scope: !46)
!55 = !DILocation(line: 46, column: 23, scope: !46)
!56 = !DILocation(line: 48, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !46, file: !10, line: 48, column: 9)
!58 = !DILocation(line: 48, column: 14, scope: !57)
!59 = !DILocation(line: 48, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !10, line: 48, column: 9)
!61 = !DILocation(line: 48, column: 23, scope: !60)
!62 = !DILocation(line: 48, column: 9, scope: !57)
!63 = !DILocation(line: 50, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !10, line: 49, column: 9)
!65 = !DILocation(line: 50, column: 23, scope: !64)
!66 = !DILocation(line: 50, column: 13, scope: !64)
!67 = !DILocation(line: 50, column: 18, scope: !64)
!68 = !DILocation(line: 50, column: 21, scope: !64)
!69 = !DILocation(line: 51, column: 9, scope: !64)
!70 = !DILocation(line: 48, column: 31, scope: !60)
!71 = !DILocation(line: 48, column: 9, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 51, column: 9, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 52, column: 9, scope: !46)
!76 = !DILocation(line: 52, column: 21, scope: !46)
!77 = !DILocation(line: 53, column: 20, scope: !46)
!78 = !DILocation(line: 53, column: 9, scope: !46)
!79 = !DILocation(line: 55, column: 1, scope: !18)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_05_good", scope: !10, file: !10, line: 120, type: !19, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 122, column: 5, scope: !80)
!82 = !DILocation(line: 123, column: 5, scope: !80)
!83 = !DILocation(line: 124, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 136, type: !85, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!11, !11, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !10, line: 136, type: !11)
!91 = !DILocation(line: 136, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !10, line: 136, type: !87)
!93 = !DILocation(line: 136, column: 27, scope: !84)
!94 = !DILocation(line: 139, column: 22, scope: !84)
!95 = !DILocation(line: 139, column: 12, scope: !84)
!96 = !DILocation(line: 139, column: 5, scope: !84)
!97 = !DILocation(line: 141, column: 5, scope: !84)
!98 = !DILocation(line: 142, column: 5, scope: !84)
!99 = !DILocation(line: 143, column: 5, scope: !84)
!100 = !DILocation(line: 146, column: 5, scope: !84)
!101 = !DILocation(line: 147, column: 5, scope: !84)
!102 = !DILocation(line: 148, column: 5, scope: !84)
!103 = !DILocation(line: 150, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!105 = !DILocalVariable(name: "data", scope: !104, file: !10, line: 64, type: !22)
!106 = !DILocation(line: 64, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !10, line: 65, type: !27)
!108 = !DILocation(line: 65, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !10, line: 66, type: !32)
!110 = !DILocation(line: 66, column: 13, scope: !104)
!111 = !DILocation(line: 67, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !10, line: 67, column: 8)
!113 = !DILocation(line: 67, column: 8, scope: !104)
!114 = !DILocation(line: 70, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !10, line: 68, column: 5)
!116 = !DILocation(line: 71, column: 5, scope: !115)
!117 = !DILocation(line: 75, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !10, line: 73, column: 5)
!119 = !DILocation(line: 75, column: 14, scope: !118)
!120 = !DILocation(line: 76, column: 9, scope: !118)
!121 = !DILocation(line: 76, column: 17, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !10, line: 79, type: !47)
!123 = distinct !DILexicalBlock(scope: !104, file: !10, line: 78, column: 5)
!124 = !DILocation(line: 79, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !10, line: 80, type: !32)
!126 = !DILocation(line: 80, column: 17, scope: !123)
!127 = !DILocation(line: 81, column: 17, scope: !123)
!128 = !DILocation(line: 81, column: 9, scope: !123)
!129 = !DILocation(line: 82, column: 9, scope: !123)
!130 = !DILocation(line: 82, column: 23, scope: !123)
!131 = !DILocation(line: 84, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !10, line: 84, column: 9)
!133 = !DILocation(line: 84, column: 14, scope: !132)
!134 = !DILocation(line: 84, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !10, line: 84, column: 9)
!136 = !DILocation(line: 84, column: 23, scope: !135)
!137 = !DILocation(line: 84, column: 9, scope: !132)
!138 = !DILocation(line: 86, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !10, line: 85, column: 9)
!140 = !DILocation(line: 86, column: 23, scope: !139)
!141 = !DILocation(line: 86, column: 13, scope: !139)
!142 = !DILocation(line: 86, column: 18, scope: !139)
!143 = !DILocation(line: 86, column: 21, scope: !139)
!144 = !DILocation(line: 87, column: 9, scope: !139)
!145 = !DILocation(line: 84, column: 31, scope: !135)
!146 = !DILocation(line: 84, column: 9, scope: !135)
!147 = distinct !{!147, !137, !148, !74}
!148 = !DILocation(line: 87, column: 9, scope: !132)
!149 = !DILocation(line: 88, column: 9, scope: !123)
!150 = !DILocation(line: 88, column: 21, scope: !123)
!151 = !DILocation(line: 89, column: 20, scope: !123)
!152 = !DILocation(line: 89, column: 9, scope: !123)
!153 = !DILocation(line: 91, column: 1, scope: !104)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "data", scope: !154, file: !10, line: 96, type: !22)
!156 = !DILocation(line: 96, column: 15, scope: !154)
!157 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !10, line: 97, type: !27)
!158 = !DILocation(line: 97, column: 13, scope: !154)
!159 = !DILocalVariable(name: "dataGoodBuffer", scope: !154, file: !10, line: 98, type: !32)
!160 = !DILocation(line: 98, column: 13, scope: !154)
!161 = !DILocation(line: 99, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !154, file: !10, line: 99, column: 8)
!163 = !DILocation(line: 99, column: 8, scope: !154)
!164 = !DILocation(line: 102, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !10, line: 100, column: 5)
!166 = !DILocation(line: 102, column: 14, scope: !165)
!167 = !DILocation(line: 103, column: 9, scope: !165)
!168 = !DILocation(line: 103, column: 17, scope: !165)
!169 = !DILocation(line: 104, column: 5, scope: !165)
!170 = !DILocalVariable(name: "i", scope: !171, file: !10, line: 106, type: !47)
!171 = distinct !DILexicalBlock(scope: !154, file: !10, line: 105, column: 5)
!172 = !DILocation(line: 106, column: 16, scope: !171)
!173 = !DILocalVariable(name: "source", scope: !171, file: !10, line: 107, type: !32)
!174 = !DILocation(line: 107, column: 17, scope: !171)
!175 = !DILocation(line: 108, column: 17, scope: !171)
!176 = !DILocation(line: 108, column: 9, scope: !171)
!177 = !DILocation(line: 109, column: 9, scope: !171)
!178 = !DILocation(line: 109, column: 23, scope: !171)
!179 = !DILocation(line: 111, column: 16, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !10, line: 111, column: 9)
!181 = !DILocation(line: 111, column: 14, scope: !180)
!182 = !DILocation(line: 111, column: 21, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !10, line: 111, column: 9)
!184 = !DILocation(line: 111, column: 23, scope: !183)
!185 = !DILocation(line: 111, column: 9, scope: !180)
!186 = !DILocation(line: 113, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !10, line: 112, column: 9)
!188 = !DILocation(line: 113, column: 23, scope: !187)
!189 = !DILocation(line: 113, column: 13, scope: !187)
!190 = !DILocation(line: 113, column: 18, scope: !187)
!191 = !DILocation(line: 113, column: 21, scope: !187)
!192 = !DILocation(line: 114, column: 9, scope: !187)
!193 = !DILocation(line: 111, column: 31, scope: !183)
!194 = !DILocation(line: 111, column: 9, scope: !183)
!195 = distinct !{!195, !185, !196, !74}
!196 = !DILocation(line: 114, column: 9, scope: !180)
!197 = !DILocation(line: 115, column: 9, scope: !171)
!198 = !DILocation(line: 115, column: 21, scope: !171)
!199 = !DILocation(line: 116, column: 20, scope: !171)
!200 = !DILocation(line: 116, column: 9, scope: !171)
!201 = !DILocation(line: 118, column: 1, scope: !154)
