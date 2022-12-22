; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !28
  store i8* %arraydecay, i8** %data, align 8, !dbg !29
  %0 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  %call = call i64 @strlen(i8* %4) #6, !dbg !54
  store i64 %call, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !59
  %6 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp1 = icmp ult i64 %5, %6, !dbg !62
  br i1 %cmp1, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !64
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !64
  %10 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !68
  store i8 %9, i8* %arrayidx3, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %11, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !76
  store i8 0, i8* %arrayidx4, align 1, !dbg !77
  %12 = load i8*, i8** %data, align 8, !dbg !78
  call void @printLine(i8* %12), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_good() #0 !dbg !81 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i8* %arraydecay, i8** %data, align 8, !dbg !109
  %0 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp = icmp ne i32 %0, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !127, metadata !DIExpression()), !dbg !128
  %4 = load i8*, i8** %data, align 8, !dbg !129
  %call = call i64 @strlen(i8* %4) #6, !dbg !130
  store i64 %call, i64* %dataLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !135
  %6 = load i64, i64* %dataLen, align 8, !dbg !137
  %cmp1 = icmp ult i64 %5, %6, !dbg !138
  br i1 %cmp1, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !140
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !140
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !140
  %10 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !144
  store i8 %9, i8* %arrayidx3, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %11, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !151
  store i8 0, i8* %arrayidx4, align 1, !dbg !152
  %12 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* %12), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !161
  store i8* %arraydecay, i8** %data, align 8, !dbg !162
  %0 = load i32, i32* @staticFive, align 4, !dbg !163
  %cmp = icmp eq i32 %0, 5, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !169
  %2 = load i8*, i8** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !173, metadata !DIExpression()), !dbg !175
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !178, metadata !DIExpression()), !dbg !179
  %4 = load i8*, i8** %data, align 8, !dbg !180
  %call = call i64 @strlen(i8* %4) #6, !dbg !181
  store i64 %call, i64* %dataLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !186
  %6 = load i64, i64* %dataLen, align 8, !dbg !188
  %cmp1 = icmp ult i64 %5, %6, !dbg !189
  br i1 %cmp1, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !191
  %8 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !191
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !191
  %10 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !195
  store i8 %9, i8* %arrayidx3, align 1, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %11, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !202
  store i8 0, i8* %arrayidx4, align 1, !dbg !203
  %12 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* %12), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocation(line: 33, column: 12, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocation(line: 34, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 8, scope: !16)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 35, column: 5)
!36 = !DILocation(line: 37, column: 9, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 21, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !8, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !8, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !8, line: 42, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 16, scope: !41)
!51 = !DILocalVariable(name: "dataLen", scope: !41, file: !8, line: 42, type: !47)
!52 = !DILocation(line: 42, column: 19, scope: !41)
!53 = !DILocation(line: 43, column: 26, scope: !41)
!54 = !DILocation(line: 43, column: 19, scope: !41)
!55 = !DILocation(line: 43, column: 17, scope: !41)
!56 = !DILocation(line: 45, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !8, line: 45, column: 9)
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
!76 = !DILocation(line: 49, column: 9, scope: !41)
!77 = !DILocation(line: 49, column: 20, scope: !41)
!78 = !DILocation(line: 50, column: 19, scope: !41)
!79 = !DILocation(line: 50, column: 9, scope: !41)
!80 = !DILocation(line: 52, column: 1, scope: !16)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_good", scope: !8, file: !8, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocation(line: 117, column: 5, scope: !81)
!83 = !DILocation(line: 118, column: 5, scope: !81)
!84 = !DILocation(line: 119, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 131, type: !86, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!86 = !DISubroutineType(types: !87)
!87 = !{!9, !9, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !8, line: 131, type: !9)
!90 = !DILocation(line: 131, column: 14, scope: !85)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !8, line: 131, type: !88)
!92 = !DILocation(line: 131, column: 27, scope: !85)
!93 = !DILocation(line: 134, column: 22, scope: !85)
!94 = !DILocation(line: 134, column: 12, scope: !85)
!95 = !DILocation(line: 134, column: 5, scope: !85)
!96 = !DILocation(line: 136, column: 5, scope: !85)
!97 = !DILocation(line: 137, column: 5, scope: !85)
!98 = !DILocation(line: 138, column: 5, scope: !85)
!99 = !DILocation(line: 141, column: 5, scope: !85)
!100 = !DILocation(line: 142, column: 5, scope: !85)
!101 = !DILocation(line: 143, column: 5, scope: !85)
!102 = !DILocation(line: 145, column: 5, scope: !85)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!104 = !DILocalVariable(name: "data", scope: !103, file: !8, line: 61, type: !20)
!105 = !DILocation(line: 61, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !8, line: 62, type: !24)
!107 = !DILocation(line: 62, column: 10, scope: !103)
!108 = !DILocation(line: 63, column: 12, scope: !103)
!109 = !DILocation(line: 63, column: 10, scope: !103)
!110 = !DILocation(line: 64, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !8, line: 64, column: 8)
!112 = !DILocation(line: 64, column: 18, scope: !111)
!113 = !DILocation(line: 64, column: 8, scope: !103)
!114 = !DILocation(line: 67, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !8, line: 65, column: 5)
!116 = !DILocation(line: 68, column: 5, scope: !115)
!117 = !DILocation(line: 72, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !8, line: 70, column: 5)
!119 = !DILocation(line: 72, column: 9, scope: !118)
!120 = !DILocation(line: 73, column: 9, scope: !118)
!121 = !DILocation(line: 73, column: 20, scope: !118)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !8, line: 76, type: !42)
!123 = distinct !DILexicalBlock(scope: !103, file: !8, line: 75, column: 5)
!124 = !DILocation(line: 76, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !8, line: 77, type: !47)
!126 = !DILocation(line: 77, column: 16, scope: !123)
!127 = !DILocalVariable(name: "dataLen", scope: !123, file: !8, line: 77, type: !47)
!128 = !DILocation(line: 77, column: 19, scope: !123)
!129 = !DILocation(line: 78, column: 26, scope: !123)
!130 = !DILocation(line: 78, column: 19, scope: !123)
!131 = !DILocation(line: 78, column: 17, scope: !123)
!132 = !DILocation(line: 80, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !8, line: 80, column: 9)
!134 = !DILocation(line: 80, column: 14, scope: !133)
!135 = !DILocation(line: 80, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !8, line: 80, column: 9)
!137 = !DILocation(line: 80, column: 25, scope: !136)
!138 = !DILocation(line: 80, column: 23, scope: !136)
!139 = !DILocation(line: 80, column: 9, scope: !133)
!140 = !DILocation(line: 82, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !8, line: 81, column: 9)
!142 = !DILocation(line: 82, column: 28, scope: !141)
!143 = !DILocation(line: 82, column: 18, scope: !141)
!144 = !DILocation(line: 82, column: 13, scope: !141)
!145 = !DILocation(line: 82, column: 21, scope: !141)
!146 = !DILocation(line: 83, column: 9, scope: !141)
!147 = !DILocation(line: 80, column: 35, scope: !136)
!148 = !DILocation(line: 80, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !75}
!150 = !DILocation(line: 83, column: 9, scope: !133)
!151 = !DILocation(line: 84, column: 9, scope: !123)
!152 = !DILocation(line: 84, column: 20, scope: !123)
!153 = !DILocation(line: 85, column: 19, scope: !123)
!154 = !DILocation(line: 85, column: 9, scope: !123)
!155 = !DILocation(line: 87, column: 1, scope: !103)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", scope: !156, file: !8, line: 92, type: !20)
!158 = !DILocation(line: 92, column: 12, scope: !156)
!159 = !DILocalVariable(name: "dataBuffer", scope: !156, file: !8, line: 93, type: !24)
!160 = !DILocation(line: 93, column: 10, scope: !156)
!161 = !DILocation(line: 94, column: 12, scope: !156)
!162 = !DILocation(line: 94, column: 10, scope: !156)
!163 = !DILocation(line: 95, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !8, line: 95, column: 8)
!165 = !DILocation(line: 95, column: 18, scope: !164)
!166 = !DILocation(line: 95, column: 8, scope: !156)
!167 = !DILocation(line: 98, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !8, line: 96, column: 5)
!169 = !DILocation(line: 98, column: 9, scope: !168)
!170 = !DILocation(line: 99, column: 9, scope: !168)
!171 = !DILocation(line: 99, column: 20, scope: !168)
!172 = !DILocation(line: 100, column: 5, scope: !168)
!173 = !DILocalVariable(name: "dest", scope: !174, file: !8, line: 102, type: !42)
!174 = distinct !DILexicalBlock(scope: !156, file: !8, line: 101, column: 5)
!175 = !DILocation(line: 102, column: 14, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !8, line: 103, type: !47)
!177 = !DILocation(line: 103, column: 16, scope: !174)
!178 = !DILocalVariable(name: "dataLen", scope: !174, file: !8, line: 103, type: !47)
!179 = !DILocation(line: 103, column: 19, scope: !174)
!180 = !DILocation(line: 104, column: 26, scope: !174)
!181 = !DILocation(line: 104, column: 19, scope: !174)
!182 = !DILocation(line: 104, column: 17, scope: !174)
!183 = !DILocation(line: 106, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !8, line: 106, column: 9)
!185 = !DILocation(line: 106, column: 14, scope: !184)
!186 = !DILocation(line: 106, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !8, line: 106, column: 9)
!188 = !DILocation(line: 106, column: 25, scope: !187)
!189 = !DILocation(line: 106, column: 23, scope: !187)
!190 = !DILocation(line: 106, column: 9, scope: !184)
!191 = !DILocation(line: 108, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !8, line: 107, column: 9)
!193 = !DILocation(line: 108, column: 28, scope: !192)
!194 = !DILocation(line: 108, column: 18, scope: !192)
!195 = !DILocation(line: 108, column: 13, scope: !192)
!196 = !DILocation(line: 108, column: 21, scope: !192)
!197 = !DILocation(line: 109, column: 9, scope: !192)
!198 = !DILocation(line: 106, column: 35, scope: !187)
!199 = !DILocation(line: 106, column: 9, scope: !187)
!200 = distinct !{!200, !190, !201, !75}
!201 = !DILocation(line: 109, column: 9, scope: !184)
!202 = !DILocation(line: 110, column: 9, scope: !174)
!203 = !DILocation(line: 110, column: 20, scope: !174)
!204 = !DILocation(line: 111, column: 19, scope: !174)
!205 = !DILocation(line: 111, column: 9, scope: !174)
!206 = !DILocation(line: 113, column: 1, scope: !156)
