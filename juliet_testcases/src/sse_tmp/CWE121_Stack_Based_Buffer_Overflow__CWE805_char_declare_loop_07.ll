; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i8* %arraydecay, i8** %data, align 8, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx2, align 1, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !57
  %cmp3 = icmp ult i64 %2, 100, !dbg !59
  br i1 %cmp3, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !63
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !63
  %5 = load i8*, i8** %data, align 8, !dbg !64
  %6 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !64
  store i8 %4, i8* %arrayidx5, align 1, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %7, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !73
  store i8 0, i8* %arrayidx6, align 1, !dbg !74
  %9 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* %9), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07_good() #0 !dbg !78 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = load i32, i32* @staticFive, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i8* %arraydecay, i8** %data, align 8, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx2, align 1, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !130
  %cmp3 = icmp ult i64 %2, 100, !dbg !132
  br i1 %cmp3, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !136
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !136
  %5 = load i8*, i8** %data, align 8, !dbg !137
  %6 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !137
  store i8 %4, i8* %arrayidx5, align 1, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %7, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !145
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !145
  store i8 0, i8* %arrayidx6, align 1, !dbg !146
  %9 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %9), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %0 = load i32, i32* @staticFive, align 4, !dbg !157
  %cmp = icmp eq i32 %0, 5, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !161
  store i8* %arraydecay, i8** %data, align 8, !dbg !163
  %1 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !164
  store i8 0, i8* %arrayidx, align 1, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !167, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !172
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !173
  store i8 0, i8* %arrayidx2, align 1, !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !178
  %cmp3 = icmp ult i64 %2, 100, !dbg !180
  br i1 %cmp3, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !184
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !184
  %5 = load i8*, i8** %data, align 8, !dbg !185
  %6 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !185
  store i8 %4, i8* %arrayidx5, align 1, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %7, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !193
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !193
  store i8 0, i8* %arrayidx6, align 1, !dbg !194
  %9 = load i8*, i8** %data, align 8, !dbg !195
  call void @printLine(i8* %9), !dbg !196
  ret void, !dbg !197
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 10, scope: !16)
!33 = !DILocation(line: 34, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!35 = !DILocation(line: 34, column: 18, scope: !34)
!36 = !DILocation(line: 34, column: 8, scope: !16)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 35, column: 5)
!39 = !DILocation(line: 38, column: 14, scope: !38)
!40 = !DILocation(line: 39, column: 9, scope: !38)
!41 = !DILocation(line: 39, column: 17, scope: !38)
!42 = !DILocation(line: 40, column: 5, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !8, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !16, file: !8, line: 41, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !44)
!49 = !DILocalVariable(name: "source", scope: !44, file: !8, line: 43, type: !29)
!50 = !DILocation(line: 43, column: 14, scope: !44)
!51 = !DILocation(line: 44, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 9, scope: !44)
!53 = !DILocation(line: 45, column: 23, scope: !44)
!54 = !DILocation(line: 47, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !44, file: !8, line: 47, column: 9)
!56 = !DILocation(line: 47, column: 14, scope: !55)
!57 = !DILocation(line: 47, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !8, line: 47, column: 9)
!59 = !DILocation(line: 47, column: 23, scope: !58)
!60 = !DILocation(line: 47, column: 9, scope: !55)
!61 = !DILocation(line: 49, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !8, line: 48, column: 9)
!63 = !DILocation(line: 49, column: 23, scope: !62)
!64 = !DILocation(line: 49, column: 13, scope: !62)
!65 = !DILocation(line: 49, column: 18, scope: !62)
!66 = !DILocation(line: 49, column: 21, scope: !62)
!67 = !DILocation(line: 50, column: 9, scope: !62)
!68 = !DILocation(line: 47, column: 31, scope: !58)
!69 = !DILocation(line: 47, column: 9, scope: !58)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 50, column: 9, scope: !55)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 51, column: 9, scope: !44)
!74 = !DILocation(line: 51, column: 21, scope: !44)
!75 = !DILocation(line: 52, column: 19, scope: !44)
!76 = !DILocation(line: 52, column: 9, scope: !44)
!77 = !DILocation(line: 54, column: 1, scope: !16)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_07_good", scope: !8, file: !8, line: 119, type: !17, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocation(line: 121, column: 5, scope: !78)
!80 = !DILocation(line: 122, column: 5, scope: !78)
!81 = !DILocation(line: 123, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 135, type: !83, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{!9, !9, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !8, line: 135, type: !9)
!87 = !DILocation(line: 135, column: 14, scope: !82)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !8, line: 135, type: !85)
!89 = !DILocation(line: 135, column: 27, scope: !82)
!90 = !DILocation(line: 138, column: 22, scope: !82)
!91 = !DILocation(line: 138, column: 12, scope: !82)
!92 = !DILocation(line: 138, column: 5, scope: !82)
!93 = !DILocation(line: 140, column: 5, scope: !82)
!94 = !DILocation(line: 141, column: 5, scope: !82)
!95 = !DILocation(line: 142, column: 5, scope: !82)
!96 = !DILocation(line: 145, column: 5, scope: !82)
!97 = !DILocation(line: 146, column: 5, scope: !82)
!98 = !DILocation(line: 147, column: 5, scope: !82)
!99 = !DILocation(line: 149, column: 5, scope: !82)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !8, line: 63, type: !20)
!102 = !DILocation(line: 63, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !8, line: 64, type: !24)
!104 = !DILocation(line: 64, column: 10, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !8, line: 65, type: !29)
!106 = !DILocation(line: 65, column: 10, scope: !100)
!107 = !DILocation(line: 66, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !8, line: 66, column: 8)
!109 = !DILocation(line: 66, column: 18, scope: !108)
!110 = !DILocation(line: 66, column: 8, scope: !100)
!111 = !DILocation(line: 69, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !8, line: 67, column: 5)
!113 = !DILocation(line: 70, column: 5, scope: !112)
!114 = !DILocation(line: 74, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !8, line: 72, column: 5)
!116 = !DILocation(line: 74, column: 14, scope: !115)
!117 = !DILocation(line: 75, column: 9, scope: !115)
!118 = !DILocation(line: 75, column: 17, scope: !115)
!119 = !DILocalVariable(name: "i", scope: !120, file: !8, line: 78, type: !45)
!120 = distinct !DILexicalBlock(scope: !100, file: !8, line: 77, column: 5)
!121 = !DILocation(line: 78, column: 16, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !120, file: !8, line: 79, type: !29)
!123 = !DILocation(line: 79, column: 14, scope: !120)
!124 = !DILocation(line: 80, column: 9, scope: !120)
!125 = !DILocation(line: 81, column: 9, scope: !120)
!126 = !DILocation(line: 81, column: 23, scope: !120)
!127 = !DILocation(line: 83, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !8, line: 83, column: 9)
!129 = !DILocation(line: 83, column: 14, scope: !128)
!130 = !DILocation(line: 83, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !8, line: 83, column: 9)
!132 = !DILocation(line: 83, column: 23, scope: !131)
!133 = !DILocation(line: 83, column: 9, scope: !128)
!134 = !DILocation(line: 85, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !8, line: 84, column: 9)
!136 = !DILocation(line: 85, column: 23, scope: !135)
!137 = !DILocation(line: 85, column: 13, scope: !135)
!138 = !DILocation(line: 85, column: 18, scope: !135)
!139 = !DILocation(line: 85, column: 21, scope: !135)
!140 = !DILocation(line: 86, column: 9, scope: !135)
!141 = !DILocation(line: 83, column: 31, scope: !131)
!142 = !DILocation(line: 83, column: 9, scope: !131)
!143 = distinct !{!143, !133, !144, !72}
!144 = !DILocation(line: 86, column: 9, scope: !128)
!145 = !DILocation(line: 87, column: 9, scope: !120)
!146 = !DILocation(line: 87, column: 21, scope: !120)
!147 = !DILocation(line: 88, column: 19, scope: !120)
!148 = !DILocation(line: 88, column: 9, scope: !120)
!149 = !DILocation(line: 90, column: 1, scope: !100)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", scope: !150, file: !8, line: 95, type: !20)
!152 = !DILocation(line: 95, column: 12, scope: !150)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !150, file: !8, line: 96, type: !24)
!154 = !DILocation(line: 96, column: 10, scope: !150)
!155 = !DILocalVariable(name: "dataGoodBuffer", scope: !150, file: !8, line: 97, type: !29)
!156 = !DILocation(line: 97, column: 10, scope: !150)
!157 = !DILocation(line: 98, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !150, file: !8, line: 98, column: 8)
!159 = !DILocation(line: 98, column: 18, scope: !158)
!160 = !DILocation(line: 98, column: 8, scope: !150)
!161 = !DILocation(line: 101, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !8, line: 99, column: 5)
!163 = !DILocation(line: 101, column: 14, scope: !162)
!164 = !DILocation(line: 102, column: 9, scope: !162)
!165 = !DILocation(line: 102, column: 17, scope: !162)
!166 = !DILocation(line: 103, column: 5, scope: !162)
!167 = !DILocalVariable(name: "i", scope: !168, file: !8, line: 105, type: !45)
!168 = distinct !DILexicalBlock(scope: !150, file: !8, line: 104, column: 5)
!169 = !DILocation(line: 105, column: 16, scope: !168)
!170 = !DILocalVariable(name: "source", scope: !168, file: !8, line: 106, type: !29)
!171 = !DILocation(line: 106, column: 14, scope: !168)
!172 = !DILocation(line: 107, column: 9, scope: !168)
!173 = !DILocation(line: 108, column: 9, scope: !168)
!174 = !DILocation(line: 108, column: 23, scope: !168)
!175 = !DILocation(line: 110, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !168, file: !8, line: 110, column: 9)
!177 = !DILocation(line: 110, column: 14, scope: !176)
!178 = !DILocation(line: 110, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !8, line: 110, column: 9)
!180 = !DILocation(line: 110, column: 23, scope: !179)
!181 = !DILocation(line: 110, column: 9, scope: !176)
!182 = !DILocation(line: 112, column: 30, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !8, line: 111, column: 9)
!184 = !DILocation(line: 112, column: 23, scope: !183)
!185 = !DILocation(line: 112, column: 13, scope: !183)
!186 = !DILocation(line: 112, column: 18, scope: !183)
!187 = !DILocation(line: 112, column: 21, scope: !183)
!188 = !DILocation(line: 113, column: 9, scope: !183)
!189 = !DILocation(line: 110, column: 31, scope: !179)
!190 = !DILocation(line: 110, column: 9, scope: !179)
!191 = distinct !{!191, !181, !192, !72}
!192 = !DILocation(line: 113, column: 9, scope: !176)
!193 = !DILocation(line: 114, column: 9, scope: !168)
!194 = !DILocation(line: 114, column: 21, scope: !168)
!195 = !DILocation(line: 115, column: 19, scope: !168)
!196 = !DILocation(line: 115, column: 9, scope: !168)
!197 = !DILocation(line: 117, column: 1, scope: !150)
