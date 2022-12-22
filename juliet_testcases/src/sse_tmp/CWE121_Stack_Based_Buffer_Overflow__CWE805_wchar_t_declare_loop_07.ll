; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx2, align 4, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !58
  %cmp3 = icmp ult i64 %2, 100, !dbg !60
  br i1 %cmp3, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !64
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !64
  %5 = load i32*, i32** %data, align 8, !dbg !65
  %6 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !65
  store i32 %4, i32* %arrayidx5, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %7, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !74
  store i32 0, i32* %arrayidx6, align 4, !dbg !75
  %9 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* %9), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #4, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #4, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp = icmp ne i32 %0, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

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
  %cmp3 = icmp ult i64 %2, 100, !dbg !136
  br i1 %cmp3, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !140
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !141
  %6 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !141
  store i32 %4, i32* %arrayidx5, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %7, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !149
  store i32 0, i32* %arrayidx6, align 4, !dbg !150
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !161
  %cmp = icmp eq i32 %0, 5, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !165
  store i32* %arraydecay, i32** %data, align 8, !dbg !167
  %1 = load i32*, i32** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !174, metadata !DIExpression()), !dbg !175
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !176
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !177
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx2, align 4, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !183
  %cmp3 = icmp ult i64 %2, 100, !dbg !185
  br i1 %cmp3, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !189
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !189
  %5 = load i32*, i32** %data, align 8, !dbg !190
  %6 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !190
  store i32 %4, i32* %arrayidx5, align 4, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %7, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !198
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !198
  store i32 0, i32* %arrayidx6, align 4, !dbg !199
  %9 = load i32*, i32** %data, align 8, !dbg !200
  call void @printWLine(i32* %9), !dbg !201
  ret void, !dbg !202
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 13, scope: !16)
!34 = !DILocation(line: 34, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 8, scope: !16)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 35, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocation(line: 40, column: 5, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !8, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !16, file: !8, line: 41, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !47)
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !45, file: !8, line: 43, type: !30)
!50 = !DILocation(line: 43, column: 17, scope: !45)
!51 = !DILocation(line: 44, column: 17, scope: !45)
!52 = !DILocation(line: 44, column: 9, scope: !45)
!53 = !DILocation(line: 45, column: 9, scope: !45)
!54 = !DILocation(line: 45, column: 23, scope: !45)
!55 = !DILocation(line: 47, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !45, file: !8, line: 47, column: 9)
!57 = !DILocation(line: 47, column: 14, scope: !56)
!58 = !DILocation(line: 47, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !8, line: 47, column: 9)
!60 = !DILocation(line: 47, column: 23, scope: !59)
!61 = !DILocation(line: 47, column: 9, scope: !56)
!62 = !DILocation(line: 49, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !8, line: 48, column: 9)
!64 = !DILocation(line: 49, column: 23, scope: !63)
!65 = !DILocation(line: 49, column: 13, scope: !63)
!66 = !DILocation(line: 49, column: 18, scope: !63)
!67 = !DILocation(line: 49, column: 21, scope: !63)
!68 = !DILocation(line: 50, column: 9, scope: !63)
!69 = !DILocation(line: 47, column: 31, scope: !59)
!70 = !DILocation(line: 47, column: 9, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 50, column: 9, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 51, column: 9, scope: !45)
!75 = !DILocation(line: 51, column: 21, scope: !45)
!76 = !DILocation(line: 52, column: 20, scope: !45)
!77 = !DILocation(line: 52, column: 9, scope: !45)
!78 = !DILocation(line: 54, column: 1, scope: !16)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_07_good", scope: !8, file: !8, line: 119, type: !17, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 121, column: 5, scope: !79)
!81 = !DILocation(line: 122, column: 5, scope: !79)
!82 = !DILocation(line: 123, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 135, type: !84, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!9, !9, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !8, line: 135, type: !9)
!90 = !DILocation(line: 135, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !8, line: 135, type: !86)
!92 = !DILocation(line: 135, column: 27, scope: !83)
!93 = !DILocation(line: 138, column: 22, scope: !83)
!94 = !DILocation(line: 138, column: 12, scope: !83)
!95 = !DILocation(line: 138, column: 5, scope: !83)
!96 = !DILocation(line: 140, column: 5, scope: !83)
!97 = !DILocation(line: 141, column: 5, scope: !83)
!98 = !DILocation(line: 142, column: 5, scope: !83)
!99 = !DILocation(line: 145, column: 5, scope: !83)
!100 = !DILocation(line: 146, column: 5, scope: !83)
!101 = !DILocation(line: 147, column: 5, scope: !83)
!102 = !DILocation(line: 149, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !8, line: 63, type: !20)
!105 = !DILocation(line: 63, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !8, line: 64, type: !25)
!107 = !DILocation(line: 64, column: 13, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !8, line: 65, type: !30)
!109 = !DILocation(line: 65, column: 13, scope: !103)
!110 = !DILocation(line: 66, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !8, line: 66, column: 8)
!112 = !DILocation(line: 66, column: 18, scope: !111)
!113 = !DILocation(line: 66, column: 8, scope: !103)
!114 = !DILocation(line: 69, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !8, line: 67, column: 5)
!116 = !DILocation(line: 70, column: 5, scope: !115)
!117 = !DILocation(line: 74, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !8, line: 72, column: 5)
!119 = !DILocation(line: 74, column: 14, scope: !118)
!120 = !DILocation(line: 75, column: 9, scope: !118)
!121 = !DILocation(line: 75, column: 17, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !8, line: 78, type: !46)
!123 = distinct !DILexicalBlock(scope: !103, file: !8, line: 77, column: 5)
!124 = !DILocation(line: 78, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !8, line: 79, type: !30)
!126 = !DILocation(line: 79, column: 17, scope: !123)
!127 = !DILocation(line: 80, column: 17, scope: !123)
!128 = !DILocation(line: 80, column: 9, scope: !123)
!129 = !DILocation(line: 81, column: 9, scope: !123)
!130 = !DILocation(line: 81, column: 23, scope: !123)
!131 = !DILocation(line: 83, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !8, line: 83, column: 9)
!133 = !DILocation(line: 83, column: 14, scope: !132)
!134 = !DILocation(line: 83, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !8, line: 83, column: 9)
!136 = !DILocation(line: 83, column: 23, scope: !135)
!137 = !DILocation(line: 83, column: 9, scope: !132)
!138 = !DILocation(line: 85, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !8, line: 84, column: 9)
!140 = !DILocation(line: 85, column: 23, scope: !139)
!141 = !DILocation(line: 85, column: 13, scope: !139)
!142 = !DILocation(line: 85, column: 18, scope: !139)
!143 = !DILocation(line: 85, column: 21, scope: !139)
!144 = !DILocation(line: 86, column: 9, scope: !139)
!145 = !DILocation(line: 83, column: 31, scope: !135)
!146 = !DILocation(line: 83, column: 9, scope: !135)
!147 = distinct !{!147, !137, !148, !73}
!148 = !DILocation(line: 86, column: 9, scope: !132)
!149 = !DILocation(line: 87, column: 9, scope: !123)
!150 = !DILocation(line: 87, column: 21, scope: !123)
!151 = !DILocation(line: 88, column: 20, scope: !123)
!152 = !DILocation(line: 88, column: 9, scope: !123)
!153 = !DILocation(line: 90, column: 1, scope: !103)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocalVariable(name: "data", scope: !154, file: !8, line: 95, type: !20)
!156 = !DILocation(line: 95, column: 15, scope: !154)
!157 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !8, line: 96, type: !25)
!158 = !DILocation(line: 96, column: 13, scope: !154)
!159 = !DILocalVariable(name: "dataGoodBuffer", scope: !154, file: !8, line: 97, type: !30)
!160 = !DILocation(line: 97, column: 13, scope: !154)
!161 = !DILocation(line: 98, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !154, file: !8, line: 98, column: 8)
!163 = !DILocation(line: 98, column: 18, scope: !162)
!164 = !DILocation(line: 98, column: 8, scope: !154)
!165 = !DILocation(line: 101, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !8, line: 99, column: 5)
!167 = !DILocation(line: 101, column: 14, scope: !166)
!168 = !DILocation(line: 102, column: 9, scope: !166)
!169 = !DILocation(line: 102, column: 17, scope: !166)
!170 = !DILocation(line: 103, column: 5, scope: !166)
!171 = !DILocalVariable(name: "i", scope: !172, file: !8, line: 105, type: !46)
!172 = distinct !DILexicalBlock(scope: !154, file: !8, line: 104, column: 5)
!173 = !DILocation(line: 105, column: 16, scope: !172)
!174 = !DILocalVariable(name: "source", scope: !172, file: !8, line: 106, type: !30)
!175 = !DILocation(line: 106, column: 17, scope: !172)
!176 = !DILocation(line: 107, column: 17, scope: !172)
!177 = !DILocation(line: 107, column: 9, scope: !172)
!178 = !DILocation(line: 108, column: 9, scope: !172)
!179 = !DILocation(line: 108, column: 23, scope: !172)
!180 = !DILocation(line: 110, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !172, file: !8, line: 110, column: 9)
!182 = !DILocation(line: 110, column: 14, scope: !181)
!183 = !DILocation(line: 110, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !8, line: 110, column: 9)
!185 = !DILocation(line: 110, column: 23, scope: !184)
!186 = !DILocation(line: 110, column: 9, scope: !181)
!187 = !DILocation(line: 112, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !8, line: 111, column: 9)
!189 = !DILocation(line: 112, column: 23, scope: !188)
!190 = !DILocation(line: 112, column: 13, scope: !188)
!191 = !DILocation(line: 112, column: 18, scope: !188)
!192 = !DILocation(line: 112, column: 21, scope: !188)
!193 = !DILocation(line: 113, column: 9, scope: !188)
!194 = !DILocation(line: 110, column: 31, scope: !184)
!195 = !DILocation(line: 110, column: 9, scope: !184)
!196 = distinct !{!196, !186, !197, !73}
!197 = !DILocation(line: 113, column: 9, scope: !181)
!198 = !DILocation(line: 114, column: 9, scope: !172)
!199 = !DILocation(line: 114, column: 21, scope: !172)
!200 = !DILocation(line: 115, column: 20, scope: !172)
!201 = !DILocation(line: 115, column: 9, scope: !172)
!202 = !DILocation(line: 117, column: 1, scope: !154)
