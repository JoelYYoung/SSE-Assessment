; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %4 = load i32*, i32** %data, align 8, !dbg !53
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !54
  store i64 %call1, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !59
  %6 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp2 = icmp ult i64 %5, %6, !dbg !62
  br i1 %cmp2, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !64
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !64
  %10 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !68
  store i32 %9, i32* %arrayidx4, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %11, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !76
  store i32 0, i32* %arrayidx5, align 4, !dbg !77
  %12 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %12), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_good() #0 !dbg !81 {
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
  %call = call i64 @time(i64* null) #6, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #6, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp ne i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !121
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !129, metadata !DIExpression()), !dbg !130
  %4 = load i32*, i32** %data, align 8, !dbg !131
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !132
  store i64 %call1, i64* %dataLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !137
  %6 = load i64, i64* %dataLen, align 8, !dbg !139
  %cmp2 = icmp ult i64 %5, %6, !dbg !140
  br i1 %cmp2, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !142
  %8 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !142
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !142
  %10 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !146
  store i32 %9, i32* %arrayidx4, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %11, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %12 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* %12), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !163
  store i32* %arraydecay, i32** %data, align 8, !dbg !164
  %0 = load i32, i32* @staticFive, align 4, !dbg !165
  %cmp = icmp eq i32 %0, 5, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !169
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !171
  %2 = load i32*, i32** %data, align 8, !dbg !172
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !172
  store i32 0, i32* %arrayidx, align 4, !dbg !173
  br label %if.end, !dbg !174

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !175, metadata !DIExpression()), !dbg !177
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !180, metadata !DIExpression()), !dbg !181
  %4 = load i32*, i32** %data, align 8, !dbg !182
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !183
  store i64 %call1, i64* %dataLen, align 8, !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !188
  %6 = load i64, i64* %dataLen, align 8, !dbg !190
  %cmp2 = icmp ult i64 %5, %6, !dbg !191
  br i1 %cmp2, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !193
  %8 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !193
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !193
  %10 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !197
  store i32 %9, i32* %arrayidx4, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %11, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !204
  store i32 0, i32* %arrayidx5, align 4, !dbg !205
  %12 = load i32*, i32** %data, align 8, !dbg !206
  call void @printWLine(i32* %12), !dbg !207
  ret void, !dbg !208
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocation(line: 33, column: 12, scope: !16)
!30 = !DILocation(line: 33, column: 10, scope: !16)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 8, scope: !16)
!35 = !DILocation(line: 37, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 35, column: 5)
!37 = !DILocation(line: 37, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 21, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !8, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !8, line: 42, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 16, scope: !42)
!51 = !DILocalVariable(name: "dataLen", scope: !42, file: !8, line: 42, type: !48)
!52 = !DILocation(line: 42, column: 19, scope: !42)
!53 = !DILocation(line: 43, column: 26, scope: !42)
!54 = !DILocation(line: 43, column: 19, scope: !42)
!55 = !DILocation(line: 43, column: 17, scope: !42)
!56 = !DILocation(line: 45, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !42, file: !8, line: 45, column: 9)
!58 = !DILocation(line: 45, column: 14, scope: !57)
!59 = !DILocation(line: 45, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !8, line: 45, column: 9)
!61 = !DILocation(line: 45, column: 25, scope: !60)
!62 = !DILocation(line: 45, column: 23, scope: !60)
!63 = !DILocation(line: 45, column: 9, scope: !57)
!64 = !DILocation(line: 47, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !8, line: 46, column: 9)
!66 = !DILocation(line: 47, column: 28, scope: !65)
!67 = !DILocation(line: 47, column: 18, scope: !65)
!68 = !DILocation(line: 47, column: 13, scope: !65)
!69 = !DILocation(line: 47, column: 21, scope: !65)
!70 = !DILocation(line: 48, column: 9, scope: !65)
!71 = !DILocation(line: 45, column: 35, scope: !60)
!72 = !DILocation(line: 45, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 48, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 49, column: 9, scope: !42)
!77 = !DILocation(line: 49, column: 20, scope: !42)
!78 = !DILocation(line: 50, column: 20, scope: !42)
!79 = !DILocation(line: 50, column: 9, scope: !42)
!80 = !DILocation(line: 52, column: 1, scope: !16)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_good", scope: !8, file: !8, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 117, column: 5, scope: !81)
!83 = !DILocation(line: 118, column: 5, scope: !81)
!84 = !DILocation(line: 119, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 131, type: !86, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!9, !9, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !8, line: 131, type: !9)
!92 = !DILocation(line: 131, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !8, line: 131, type: !88)
!94 = !DILocation(line: 131, column: 27, scope: !85)
!95 = !DILocation(line: 134, column: 22, scope: !85)
!96 = !DILocation(line: 134, column: 12, scope: !85)
!97 = !DILocation(line: 134, column: 5, scope: !85)
!98 = !DILocation(line: 136, column: 5, scope: !85)
!99 = !DILocation(line: 137, column: 5, scope: !85)
!100 = !DILocation(line: 138, column: 5, scope: !85)
!101 = !DILocation(line: 141, column: 5, scope: !85)
!102 = !DILocation(line: 142, column: 5, scope: !85)
!103 = !DILocation(line: 143, column: 5, scope: !85)
!104 = !DILocation(line: 145, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !8, line: 61, type: !20)
!107 = !DILocation(line: 61, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !8, line: 62, type: !25)
!109 = !DILocation(line: 62, column: 13, scope: !105)
!110 = !DILocation(line: 63, column: 12, scope: !105)
!111 = !DILocation(line: 63, column: 10, scope: !105)
!112 = !DILocation(line: 64, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !8, line: 64, column: 8)
!114 = !DILocation(line: 64, column: 18, scope: !113)
!115 = !DILocation(line: 64, column: 8, scope: !105)
!116 = !DILocation(line: 67, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !8, line: 65, column: 5)
!118 = !DILocation(line: 68, column: 5, scope: !117)
!119 = !DILocation(line: 72, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !8, line: 70, column: 5)
!121 = !DILocation(line: 72, column: 9, scope: !120)
!122 = !DILocation(line: 73, column: 9, scope: !120)
!123 = !DILocation(line: 73, column: 20, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !8, line: 76, type: !43)
!125 = distinct !DILexicalBlock(scope: !105, file: !8, line: 75, column: 5)
!126 = !DILocation(line: 76, column: 17, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !8, line: 77, type: !48)
!128 = !DILocation(line: 77, column: 16, scope: !125)
!129 = !DILocalVariable(name: "dataLen", scope: !125, file: !8, line: 77, type: !48)
!130 = !DILocation(line: 77, column: 19, scope: !125)
!131 = !DILocation(line: 78, column: 26, scope: !125)
!132 = !DILocation(line: 78, column: 19, scope: !125)
!133 = !DILocation(line: 78, column: 17, scope: !125)
!134 = !DILocation(line: 80, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !8, line: 80, column: 9)
!136 = !DILocation(line: 80, column: 14, scope: !135)
!137 = !DILocation(line: 80, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !8, line: 80, column: 9)
!139 = !DILocation(line: 80, column: 25, scope: !138)
!140 = !DILocation(line: 80, column: 23, scope: !138)
!141 = !DILocation(line: 80, column: 9, scope: !135)
!142 = !DILocation(line: 82, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !8, line: 81, column: 9)
!144 = !DILocation(line: 82, column: 28, scope: !143)
!145 = !DILocation(line: 82, column: 18, scope: !143)
!146 = !DILocation(line: 82, column: 13, scope: !143)
!147 = !DILocation(line: 82, column: 21, scope: !143)
!148 = !DILocation(line: 83, column: 9, scope: !143)
!149 = !DILocation(line: 80, column: 35, scope: !138)
!150 = !DILocation(line: 80, column: 9, scope: !138)
!151 = distinct !{!151, !141, !152, !75}
!152 = !DILocation(line: 83, column: 9, scope: !135)
!153 = !DILocation(line: 84, column: 9, scope: !125)
!154 = !DILocation(line: 84, column: 20, scope: !125)
!155 = !DILocation(line: 85, column: 20, scope: !125)
!156 = !DILocation(line: 85, column: 9, scope: !125)
!157 = !DILocation(line: 87, column: 1, scope: !105)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", scope: !158, file: !8, line: 92, type: !20)
!160 = !DILocation(line: 92, column: 15, scope: !158)
!161 = !DILocalVariable(name: "dataBuffer", scope: !158, file: !8, line: 93, type: !25)
!162 = !DILocation(line: 93, column: 13, scope: !158)
!163 = !DILocation(line: 94, column: 12, scope: !158)
!164 = !DILocation(line: 94, column: 10, scope: !158)
!165 = !DILocation(line: 95, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !158, file: !8, line: 95, column: 8)
!167 = !DILocation(line: 95, column: 18, scope: !166)
!168 = !DILocation(line: 95, column: 8, scope: !158)
!169 = !DILocation(line: 98, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !8, line: 96, column: 5)
!171 = !DILocation(line: 98, column: 9, scope: !170)
!172 = !DILocation(line: 99, column: 9, scope: !170)
!173 = !DILocation(line: 99, column: 20, scope: !170)
!174 = !DILocation(line: 100, column: 5, scope: !170)
!175 = !DILocalVariable(name: "dest", scope: !176, file: !8, line: 102, type: !43)
!176 = distinct !DILexicalBlock(scope: !158, file: !8, line: 101, column: 5)
!177 = !DILocation(line: 102, column: 17, scope: !176)
!178 = !DILocalVariable(name: "i", scope: !176, file: !8, line: 103, type: !48)
!179 = !DILocation(line: 103, column: 16, scope: !176)
!180 = !DILocalVariable(name: "dataLen", scope: !176, file: !8, line: 103, type: !48)
!181 = !DILocation(line: 103, column: 19, scope: !176)
!182 = !DILocation(line: 104, column: 26, scope: !176)
!183 = !DILocation(line: 104, column: 19, scope: !176)
!184 = !DILocation(line: 104, column: 17, scope: !176)
!185 = !DILocation(line: 106, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !8, line: 106, column: 9)
!187 = !DILocation(line: 106, column: 14, scope: !186)
!188 = !DILocation(line: 106, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !8, line: 106, column: 9)
!190 = !DILocation(line: 106, column: 25, scope: !189)
!191 = !DILocation(line: 106, column: 23, scope: !189)
!192 = !DILocation(line: 106, column: 9, scope: !186)
!193 = !DILocation(line: 108, column: 23, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !8, line: 107, column: 9)
!195 = !DILocation(line: 108, column: 28, scope: !194)
!196 = !DILocation(line: 108, column: 18, scope: !194)
!197 = !DILocation(line: 108, column: 13, scope: !194)
!198 = !DILocation(line: 108, column: 21, scope: !194)
!199 = !DILocation(line: 109, column: 9, scope: !194)
!200 = !DILocation(line: 106, column: 35, scope: !189)
!201 = !DILocation(line: 106, column: 9, scope: !189)
!202 = distinct !{!202, !192, !203, !75}
!203 = !DILocation(line: 109, column: 9, scope: !186)
!204 = !DILocation(line: 110, column: 9, scope: !176)
!205 = !DILocation(line: 110, column: 20, scope: !176)
!206 = !DILocation(line: 111, column: 20, scope: !176)
!207 = !DILocation(line: 111, column: 9, scope: !176)
!208 = !DILocation(line: 113, column: 1, scope: !158)
