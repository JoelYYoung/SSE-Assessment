; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #6, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %4 = load i32*, i32** %data, align 8, !dbg !54
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !55
  store i64 %call1, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !60
  %6 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp = icmp ult i64 %5, %6, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !65
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !65
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !65
  %10 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !69
  store i32 %9, i32* %arrayidx3, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %11, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !77
  store i32 0, i32* %arrayidx4, align 4, !dbg !78
  %12 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %12), !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #6, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #6, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay, i32** %data, align 8, !dbg !112
  %0 = load i32, i32* @staticFalse, align 4, !dbg !113
  %tobool = icmp ne i32 %0, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.else, !dbg !115

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
  %cmp = icmp ult i64 %5, %6, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !142
  %8 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !142
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !142
  %10 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !146
  store i32 %9, i32* %arrayidx3, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %11, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !153
  store i32 0, i32* %arrayidx4, align 4, !dbg !154
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !165
  %tobool = icmp ne i32 %0, 0, !dbg !165
  br i1 %tobool, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !168
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #6, !dbg !170
  %2 = load i32*, i32** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !174, metadata !DIExpression()), !dbg !176
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !179, metadata !DIExpression()), !dbg !180
  %4 = load i32*, i32** %data, align 8, !dbg !181
  %call1 = call i64 @wcslen(i32* %4) #7, !dbg !182
  store i64 %call1, i64* %dataLen, align 8, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !187
  %6 = load i64, i64* %dataLen, align 8, !dbg !189
  %cmp = icmp ult i64 %5, %6, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !192
  %8 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !192
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !192
  %10 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !196
  store i32 %9, i32* %arrayidx3, align 4, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %11, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !203
  store i32 0, i32* %arrayidx4, align 4, !dbg !204
  %12 = load i32*, i32** %data, align 8, !dbg !205
  call void @printWLine(i32* %12), !dbg !206
  ret void, !dbg !207
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!31 = !DILocation(line: 34, column: 12, scope: !18)
!32 = !DILocation(line: 34, column: 10, scope: !18)
!33 = !DILocation(line: 35, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!35 = !DILocation(line: 35, column: 8, scope: !18)
!36 = !DILocation(line: 38, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 36, column: 5)
!38 = !DILocation(line: 38, column: 9, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 21, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !10, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !43, file: !10, line: 43, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 43, column: 16, scope: !43)
!52 = !DILocalVariable(name: "dataLen", scope: !43, file: !10, line: 43, type: !49)
!53 = !DILocation(line: 43, column: 19, scope: !43)
!54 = !DILocation(line: 44, column: 26, scope: !43)
!55 = !DILocation(line: 44, column: 19, scope: !43)
!56 = !DILocation(line: 44, column: 17, scope: !43)
!57 = !DILocation(line: 46, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !43, file: !10, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 14, scope: !58)
!60 = !DILocation(line: 46, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !10, line: 46, column: 9)
!62 = !DILocation(line: 46, column: 25, scope: !61)
!63 = !DILocation(line: 46, column: 23, scope: !61)
!64 = !DILocation(line: 46, column: 9, scope: !58)
!65 = !DILocation(line: 48, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !10, line: 47, column: 9)
!67 = !DILocation(line: 48, column: 28, scope: !66)
!68 = !DILocation(line: 48, column: 18, scope: !66)
!69 = !DILocation(line: 48, column: 13, scope: !66)
!70 = !DILocation(line: 48, column: 21, scope: !66)
!71 = !DILocation(line: 49, column: 9, scope: !66)
!72 = !DILocation(line: 46, column: 35, scope: !61)
!73 = !DILocation(line: 46, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 49, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 50, column: 9, scope: !43)
!78 = !DILocation(line: 50, column: 20, scope: !43)
!79 = !DILocation(line: 51, column: 20, scope: !43)
!80 = !DILocation(line: 51, column: 9, scope: !43)
!81 = !DILocation(line: 53, column: 1, scope: !18)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_05_good", scope: !10, file: !10, line: 116, type: !19, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocation(line: 118, column: 5, scope: !82)
!84 = !DILocation(line: 119, column: 5, scope: !82)
!85 = !DILocation(line: 120, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 132, type: !87, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DISubroutineType(types: !88)
!88 = !{!11, !11, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !10, line: 132, type: !11)
!93 = !DILocation(line: 132, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !10, line: 132, type: !89)
!95 = !DILocation(line: 132, column: 27, scope: !86)
!96 = !DILocation(line: 135, column: 22, scope: !86)
!97 = !DILocation(line: 135, column: 12, scope: !86)
!98 = !DILocation(line: 135, column: 5, scope: !86)
!99 = !DILocation(line: 137, column: 5, scope: !86)
!100 = !DILocation(line: 138, column: 5, scope: !86)
!101 = !DILocation(line: 139, column: 5, scope: !86)
!102 = !DILocation(line: 142, column: 5, scope: !86)
!103 = !DILocation(line: 143, column: 5, scope: !86)
!104 = !DILocation(line: 144, column: 5, scope: !86)
!105 = !DILocation(line: 146, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !10, line: 62, type: !22)
!108 = !DILocation(line: 62, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !10, line: 63, type: !27)
!110 = !DILocation(line: 63, column: 13, scope: !106)
!111 = !DILocation(line: 64, column: 12, scope: !106)
!112 = !DILocation(line: 64, column: 10, scope: !106)
!113 = !DILocation(line: 65, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !10, line: 65, column: 8)
!115 = !DILocation(line: 65, column: 8, scope: !106)
!116 = !DILocation(line: 68, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !10, line: 66, column: 5)
!118 = !DILocation(line: 69, column: 5, scope: !117)
!119 = !DILocation(line: 73, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !114, file: !10, line: 71, column: 5)
!121 = !DILocation(line: 73, column: 9, scope: !120)
!122 = !DILocation(line: 74, column: 9, scope: !120)
!123 = !DILocation(line: 74, column: 20, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !10, line: 77, type: !44)
!125 = distinct !DILexicalBlock(scope: !106, file: !10, line: 76, column: 5)
!126 = !DILocation(line: 77, column: 17, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !10, line: 78, type: !49)
!128 = !DILocation(line: 78, column: 16, scope: !125)
!129 = !DILocalVariable(name: "dataLen", scope: !125, file: !10, line: 78, type: !49)
!130 = !DILocation(line: 78, column: 19, scope: !125)
!131 = !DILocation(line: 79, column: 26, scope: !125)
!132 = !DILocation(line: 79, column: 19, scope: !125)
!133 = !DILocation(line: 79, column: 17, scope: !125)
!134 = !DILocation(line: 81, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !10, line: 81, column: 9)
!136 = !DILocation(line: 81, column: 14, scope: !135)
!137 = !DILocation(line: 81, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !10, line: 81, column: 9)
!139 = !DILocation(line: 81, column: 25, scope: !138)
!140 = !DILocation(line: 81, column: 23, scope: !138)
!141 = !DILocation(line: 81, column: 9, scope: !135)
!142 = !DILocation(line: 83, column: 23, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !10, line: 82, column: 9)
!144 = !DILocation(line: 83, column: 28, scope: !143)
!145 = !DILocation(line: 83, column: 18, scope: !143)
!146 = !DILocation(line: 83, column: 13, scope: !143)
!147 = !DILocation(line: 83, column: 21, scope: !143)
!148 = !DILocation(line: 84, column: 9, scope: !143)
!149 = !DILocation(line: 81, column: 35, scope: !138)
!150 = !DILocation(line: 81, column: 9, scope: !138)
!151 = distinct !{!151, !141, !152, !76}
!152 = !DILocation(line: 84, column: 9, scope: !135)
!153 = !DILocation(line: 85, column: 9, scope: !125)
!154 = !DILocation(line: 85, column: 20, scope: !125)
!155 = !DILocation(line: 86, column: 20, scope: !125)
!156 = !DILocation(line: 86, column: 9, scope: !125)
!157 = !DILocation(line: 88, column: 1, scope: !106)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 91, type: !19, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "data", scope: !158, file: !10, line: 93, type: !22)
!160 = !DILocation(line: 93, column: 15, scope: !158)
!161 = !DILocalVariable(name: "dataBuffer", scope: !158, file: !10, line: 94, type: !27)
!162 = !DILocation(line: 94, column: 13, scope: !158)
!163 = !DILocation(line: 95, column: 12, scope: !158)
!164 = !DILocation(line: 95, column: 10, scope: !158)
!165 = !DILocation(line: 96, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !158, file: !10, line: 96, column: 8)
!167 = !DILocation(line: 96, column: 8, scope: !158)
!168 = !DILocation(line: 99, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !10, line: 97, column: 5)
!170 = !DILocation(line: 99, column: 9, scope: !169)
!171 = !DILocation(line: 100, column: 9, scope: !169)
!172 = !DILocation(line: 100, column: 20, scope: !169)
!173 = !DILocation(line: 101, column: 5, scope: !169)
!174 = !DILocalVariable(name: "dest", scope: !175, file: !10, line: 103, type: !44)
!175 = distinct !DILexicalBlock(scope: !158, file: !10, line: 102, column: 5)
!176 = !DILocation(line: 103, column: 17, scope: !175)
!177 = !DILocalVariable(name: "i", scope: !175, file: !10, line: 104, type: !49)
!178 = !DILocation(line: 104, column: 16, scope: !175)
!179 = !DILocalVariable(name: "dataLen", scope: !175, file: !10, line: 104, type: !49)
!180 = !DILocation(line: 104, column: 19, scope: !175)
!181 = !DILocation(line: 105, column: 26, scope: !175)
!182 = !DILocation(line: 105, column: 19, scope: !175)
!183 = !DILocation(line: 105, column: 17, scope: !175)
!184 = !DILocation(line: 107, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !175, file: !10, line: 107, column: 9)
!186 = !DILocation(line: 107, column: 14, scope: !185)
!187 = !DILocation(line: 107, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !10, line: 107, column: 9)
!189 = !DILocation(line: 107, column: 25, scope: !188)
!190 = !DILocation(line: 107, column: 23, scope: !188)
!191 = !DILocation(line: 107, column: 9, scope: !185)
!192 = !DILocation(line: 109, column: 23, scope: !193)
!193 = distinct !DILexicalBlock(scope: !188, file: !10, line: 108, column: 9)
!194 = !DILocation(line: 109, column: 28, scope: !193)
!195 = !DILocation(line: 109, column: 18, scope: !193)
!196 = !DILocation(line: 109, column: 13, scope: !193)
!197 = !DILocation(line: 109, column: 21, scope: !193)
!198 = !DILocation(line: 110, column: 9, scope: !193)
!199 = !DILocation(line: 107, column: 35, scope: !188)
!200 = !DILocation(line: 107, column: 9, scope: !188)
!201 = distinct !{!201, !191, !202, !76}
!202 = !DILocation(line: 110, column: 9, scope: !185)
!203 = !DILocation(line: 111, column: 9, scope: !175)
!204 = !DILocation(line: 111, column: 20, scope: !175)
!205 = !DILocation(line: 112, column: 20, scope: !175)
!206 = !DILocation(line: 112, column: 9, scope: !175)
!207 = !DILocation(line: 114, column: 1, scope: !158)
