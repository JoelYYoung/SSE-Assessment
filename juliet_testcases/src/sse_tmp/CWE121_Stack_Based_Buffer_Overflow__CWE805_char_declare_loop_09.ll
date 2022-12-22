; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %0, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx2, align 1, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %2, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !58
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !58
  %5 = load i8*, i8** %data, align 8, !dbg !59
  %6 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !59
  store i8 %4, i8* %arrayidx4, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %7, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !68
  store i8 0, i8* %arrayidx5, align 1, !dbg !69
  %9 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end, !dbg !108

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store i8* %arraydecay, i8** %data, align 8, !dbg !111
  %1 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx2, align 1, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !125
  %cmp = icmp ult i64 %2, 100, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !131
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  %6 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !132
  store i8 %4, i8* %arrayidx4, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %7, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !140
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !140
  store i8 0, i8* %arrayidx5, align 1, !dbg !141
  %9 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %9), !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !152
  %tobool = icmp ne i32 %0, 0, !dbg !152
  br i1 %tobool, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !155
  store i8* %arraydecay, i8** %data, align 8, !dbg !157
  %1 = load i8*, i8** %data, align 8, !dbg !158
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !158
  store i8 0, i8* %arrayidx, align 1, !dbg !159
  br label %if.end, !dbg !160

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !166
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx2, align 1, !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !172
  %cmp = icmp ult i64 %2, 100, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !178
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !178
  %5 = load i8*, i8** %data, align 8, !dbg !179
  %6 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !179
  store i8 %4, i8* %arrayidx4, align 1, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %7, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !187
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !187
  store i8 0, i8* %arrayidx5, align 1, !dbg !188
  %9 = load i8*, i8** %data, align 8, !dbg !189
  call void @printLine(i8* %9), !dbg !190
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 8, scope: !11)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 14, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !33)
!36 = !DILocation(line: 33, column: 17, scope: !33)
!37 = !DILocation(line: 34, column: 5, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 36, column: 16, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 37, type: !25)
!45 = !DILocation(line: 37, column: 14, scope: !39)
!46 = !DILocation(line: 38, column: 9, scope: !39)
!47 = !DILocation(line: 39, column: 9, scope: !39)
!48 = !DILocation(line: 39, column: 23, scope: !39)
!49 = !DILocation(line: 41, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !39, file: !12, line: 41, column: 9)
!51 = !DILocation(line: 41, column: 14, scope: !50)
!52 = !DILocation(line: 41, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 41, column: 9)
!54 = !DILocation(line: 41, column: 23, scope: !53)
!55 = !DILocation(line: 41, column: 9, scope: !50)
!56 = !DILocation(line: 43, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 42, column: 9)
!58 = !DILocation(line: 43, column: 23, scope: !57)
!59 = !DILocation(line: 43, column: 13, scope: !57)
!60 = !DILocation(line: 43, column: 18, scope: !57)
!61 = !DILocation(line: 43, column: 21, scope: !57)
!62 = !DILocation(line: 44, column: 9, scope: !57)
!63 = !DILocation(line: 41, column: 31, scope: !53)
!64 = !DILocation(line: 41, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 44, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 45, column: 9, scope: !39)
!69 = !DILocation(line: 45, column: 21, scope: !39)
!70 = !DILocation(line: 46, column: 19, scope: !39)
!71 = !DILocation(line: 46, column: 9, scope: !39)
!72 = !DILocation(line: 48, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_09_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 115, column: 5, scope: !73)
!75 = !DILocation(line: 116, column: 5, scope: !73)
!76 = !DILocation(line: 117, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !78, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 129, type: !80)
!83 = !DILocation(line: 129, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 129, type: !81)
!85 = !DILocation(line: 129, column: 27, scope: !77)
!86 = !DILocation(line: 132, column: 22, scope: !77)
!87 = !DILocation(line: 132, column: 12, scope: !77)
!88 = !DILocation(line: 132, column: 5, scope: !77)
!89 = !DILocation(line: 134, column: 5, scope: !77)
!90 = !DILocation(line: 135, column: 5, scope: !77)
!91 = !DILocation(line: 136, column: 5, scope: !77)
!92 = !DILocation(line: 139, column: 5, scope: !77)
!93 = !DILocation(line: 140, column: 5, scope: !77)
!94 = !DILocation(line: 141, column: 5, scope: !77)
!95 = !DILocation(line: 143, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 57, type: !16)
!98 = !DILocation(line: 57, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 58, type: !20)
!100 = !DILocation(line: 58, column: 10, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 59, type: !25)
!102 = !DILocation(line: 59, column: 10, scope: !96)
!103 = !DILocation(line: 60, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !12, line: 60, column: 8)
!105 = !DILocation(line: 60, column: 8, scope: !96)
!106 = !DILocation(line: 63, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !12, line: 61, column: 5)
!108 = !DILocation(line: 64, column: 5, scope: !107)
!109 = !DILocation(line: 68, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !12, line: 66, column: 5)
!111 = !DILocation(line: 68, column: 14, scope: !110)
!112 = !DILocation(line: 69, column: 9, scope: !110)
!113 = !DILocation(line: 69, column: 17, scope: !110)
!114 = !DILocalVariable(name: "i", scope: !115, file: !12, line: 72, type: !40)
!115 = distinct !DILexicalBlock(scope: !96, file: !12, line: 71, column: 5)
!116 = !DILocation(line: 72, column: 16, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !115, file: !12, line: 73, type: !25)
!118 = !DILocation(line: 73, column: 14, scope: !115)
!119 = !DILocation(line: 74, column: 9, scope: !115)
!120 = !DILocation(line: 75, column: 9, scope: !115)
!121 = !DILocation(line: 75, column: 23, scope: !115)
!122 = !DILocation(line: 77, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !12, line: 77, column: 9)
!124 = !DILocation(line: 77, column: 14, scope: !123)
!125 = !DILocation(line: 77, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 77, column: 9)
!127 = !DILocation(line: 77, column: 23, scope: !126)
!128 = !DILocation(line: 77, column: 9, scope: !123)
!129 = !DILocation(line: 79, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 78, column: 9)
!131 = !DILocation(line: 79, column: 23, scope: !130)
!132 = !DILocation(line: 79, column: 13, scope: !130)
!133 = !DILocation(line: 79, column: 18, scope: !130)
!134 = !DILocation(line: 79, column: 21, scope: !130)
!135 = !DILocation(line: 80, column: 9, scope: !130)
!136 = !DILocation(line: 77, column: 31, scope: !126)
!137 = !DILocation(line: 77, column: 9, scope: !126)
!138 = distinct !{!138, !128, !139, !67}
!139 = !DILocation(line: 80, column: 9, scope: !123)
!140 = !DILocation(line: 81, column: 9, scope: !115)
!141 = !DILocation(line: 81, column: 21, scope: !115)
!142 = !DILocation(line: 82, column: 19, scope: !115)
!143 = !DILocation(line: 82, column: 9, scope: !115)
!144 = !DILocation(line: 84, column: 1, scope: !96)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 89, type: !16)
!147 = !DILocation(line: 89, column: 12, scope: !145)
!148 = !DILocalVariable(name: "dataBadBuffer", scope: !145, file: !12, line: 90, type: !20)
!149 = !DILocation(line: 90, column: 10, scope: !145)
!150 = !DILocalVariable(name: "dataGoodBuffer", scope: !145, file: !12, line: 91, type: !25)
!151 = !DILocation(line: 91, column: 10, scope: !145)
!152 = !DILocation(line: 92, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !12, line: 92, column: 8)
!154 = !DILocation(line: 92, column: 8, scope: !145)
!155 = !DILocation(line: 95, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !12, line: 93, column: 5)
!157 = !DILocation(line: 95, column: 14, scope: !156)
!158 = !DILocation(line: 96, column: 9, scope: !156)
!159 = !DILocation(line: 96, column: 17, scope: !156)
!160 = !DILocation(line: 97, column: 5, scope: !156)
!161 = !DILocalVariable(name: "i", scope: !162, file: !12, line: 99, type: !40)
!162 = distinct !DILexicalBlock(scope: !145, file: !12, line: 98, column: 5)
!163 = !DILocation(line: 99, column: 16, scope: !162)
!164 = !DILocalVariable(name: "source", scope: !162, file: !12, line: 100, type: !25)
!165 = !DILocation(line: 100, column: 14, scope: !162)
!166 = !DILocation(line: 101, column: 9, scope: !162)
!167 = !DILocation(line: 102, column: 9, scope: !162)
!168 = !DILocation(line: 102, column: 23, scope: !162)
!169 = !DILocation(line: 104, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !162, file: !12, line: 104, column: 9)
!171 = !DILocation(line: 104, column: 14, scope: !170)
!172 = !DILocation(line: 104, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !12, line: 104, column: 9)
!174 = !DILocation(line: 104, column: 23, scope: !173)
!175 = !DILocation(line: 104, column: 9, scope: !170)
!176 = !DILocation(line: 106, column: 30, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !12, line: 105, column: 9)
!178 = !DILocation(line: 106, column: 23, scope: !177)
!179 = !DILocation(line: 106, column: 13, scope: !177)
!180 = !DILocation(line: 106, column: 18, scope: !177)
!181 = !DILocation(line: 106, column: 21, scope: !177)
!182 = !DILocation(line: 107, column: 9, scope: !177)
!183 = !DILocation(line: 104, column: 31, scope: !173)
!184 = !DILocation(line: 104, column: 9, scope: !173)
!185 = distinct !{!185, !175, !186, !67}
!186 = !DILocation(line: 107, column: 9, scope: !170)
!187 = !DILocation(line: 108, column: 9, scope: !162)
!188 = !DILocation(line: 108, column: 21, scope: !162)
!189 = !DILocation(line: 109, column: 19, scope: !162)
!190 = !DILocation(line: 109, column: 9, scope: !162)
!191 = !DILocation(line: 111, column: 1, scope: !145)
