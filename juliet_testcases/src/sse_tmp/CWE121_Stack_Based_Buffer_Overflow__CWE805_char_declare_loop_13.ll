; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %1 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx2, align 1, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp3 = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp3, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !59
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !59
  %5 = load i8*, i8** %data, align 8, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !60
  store i8 %4, i8* %arrayidx5, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %7, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !69
  store i8 0, i8* %arrayidx6, align 1, !dbg !70
  %9 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %9), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !104
  %cmp = icmp ne i32 %0, 5, !dbg !106
  br i1 %cmp, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay, i8** %data, align 8, !dbg !113
  %1 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !121
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx2, align 1, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !127
  %cmp3 = icmp ult i64 %2, 100, !dbg !129
  br i1 %cmp3, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !133
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !133
  %5 = load i8*, i8** %data, align 8, !dbg !134
  %6 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !134
  store i8 %4, i8* %arrayidx5, align 1, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %7, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !142
  store i8 0, i8* %arrayidx6, align 1, !dbg !143
  %9 = load i8*, i8** %data, align 8, !dbg !144
  call void @printLine(i8* %9), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !154
  %cmp = icmp eq i32 %0, 5, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !158
  store i8* %arraydecay, i8** %data, align 8, !dbg !160
  %1 = load i8*, i8** %data, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !162
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !169
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx2, align 1, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !175
  %cmp3 = icmp ult i64 %2, 100, !dbg !177
  br i1 %cmp3, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !181
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !181
  %5 = load i8*, i8** %data, align 8, !dbg !182
  %6 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !182
  store i8 %4, i8* %arrayidx5, align 1, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %7, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !190
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !190
  store i8 0, i8* %arrayidx6, align 1, !dbg !191
  %9 = load i8*, i8** %data, align 8, !dbg !192
  call void @printLine(i8* %9), !dbg !193
  ret void, !dbg !194
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 25, scope: !30)
!32 = !DILocation(line: 28, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 36, column: 16, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 37, type: !25)
!46 = !DILocation(line: 37, column: 14, scope: !40)
!47 = !DILocation(line: 38, column: 9, scope: !40)
!48 = !DILocation(line: 39, column: 9, scope: !40)
!49 = !DILocation(line: 39, column: 23, scope: !40)
!50 = !DILocation(line: 41, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !40, file: !12, line: 41, column: 9)
!52 = !DILocation(line: 41, column: 14, scope: !51)
!53 = !DILocation(line: 41, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 41, column: 9)
!55 = !DILocation(line: 41, column: 23, scope: !54)
!56 = !DILocation(line: 41, column: 9, scope: !51)
!57 = !DILocation(line: 43, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 42, column: 9)
!59 = !DILocation(line: 43, column: 23, scope: !58)
!60 = !DILocation(line: 43, column: 13, scope: !58)
!61 = !DILocation(line: 43, column: 18, scope: !58)
!62 = !DILocation(line: 43, column: 21, scope: !58)
!63 = !DILocation(line: 44, column: 9, scope: !58)
!64 = !DILocation(line: 41, column: 31, scope: !54)
!65 = !DILocation(line: 41, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 44, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 45, column: 9, scope: !40)
!70 = !DILocation(line: 45, column: 21, scope: !40)
!71 = !DILocation(line: 46, column: 19, scope: !40)
!72 = !DILocation(line: 46, column: 9, scope: !40)
!73 = !DILocation(line: 48, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_13_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 115, column: 5, scope: !74)
!76 = !DILocation(line: 116, column: 5, scope: !74)
!77 = !DILocation(line: 117, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !79, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 129, type: !81)
!84 = !DILocation(line: 129, column: 14, scope: !78)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 129, type: !82)
!86 = !DILocation(line: 129, column: 27, scope: !78)
!87 = !DILocation(line: 132, column: 22, scope: !78)
!88 = !DILocation(line: 132, column: 12, scope: !78)
!89 = !DILocation(line: 132, column: 5, scope: !78)
!90 = !DILocation(line: 134, column: 5, scope: !78)
!91 = !DILocation(line: 135, column: 5, scope: !78)
!92 = !DILocation(line: 136, column: 5, scope: !78)
!93 = !DILocation(line: 139, column: 5, scope: !78)
!94 = !DILocation(line: 140, column: 5, scope: !78)
!95 = !DILocation(line: 141, column: 5, scope: !78)
!96 = !DILocation(line: 143, column: 5, scope: !78)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 57, type: !16)
!99 = !DILocation(line: 57, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 58, type: !20)
!101 = !DILocation(line: 58, column: 10, scope: !97)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 59, type: !25)
!103 = !DILocation(line: 59, column: 10, scope: !97)
!104 = !DILocation(line: 60, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !12, line: 60, column: 8)
!106 = !DILocation(line: 60, column: 25, scope: !105)
!107 = !DILocation(line: 60, column: 8, scope: !97)
!108 = !DILocation(line: 63, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !12, line: 61, column: 5)
!110 = !DILocation(line: 64, column: 5, scope: !109)
!111 = !DILocation(line: 68, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !105, file: !12, line: 66, column: 5)
!113 = !DILocation(line: 68, column: 14, scope: !112)
!114 = !DILocation(line: 69, column: 9, scope: !112)
!115 = !DILocation(line: 69, column: 17, scope: !112)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 72, type: !41)
!117 = distinct !DILexicalBlock(scope: !97, file: !12, line: 71, column: 5)
!118 = !DILocation(line: 72, column: 16, scope: !117)
!119 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 73, type: !25)
!120 = !DILocation(line: 73, column: 14, scope: !117)
!121 = !DILocation(line: 74, column: 9, scope: !117)
!122 = !DILocation(line: 75, column: 9, scope: !117)
!123 = !DILocation(line: 75, column: 23, scope: !117)
!124 = !DILocation(line: 77, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !12, line: 77, column: 9)
!126 = !DILocation(line: 77, column: 14, scope: !125)
!127 = !DILocation(line: 77, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 77, column: 9)
!129 = !DILocation(line: 77, column: 23, scope: !128)
!130 = !DILocation(line: 77, column: 9, scope: !125)
!131 = !DILocation(line: 79, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 78, column: 9)
!133 = !DILocation(line: 79, column: 23, scope: !132)
!134 = !DILocation(line: 79, column: 13, scope: !132)
!135 = !DILocation(line: 79, column: 18, scope: !132)
!136 = !DILocation(line: 79, column: 21, scope: !132)
!137 = !DILocation(line: 80, column: 9, scope: !132)
!138 = !DILocation(line: 77, column: 31, scope: !128)
!139 = !DILocation(line: 77, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !68}
!141 = !DILocation(line: 80, column: 9, scope: !125)
!142 = !DILocation(line: 81, column: 9, scope: !117)
!143 = !DILocation(line: 81, column: 21, scope: !117)
!144 = !DILocation(line: 82, column: 19, scope: !117)
!145 = !DILocation(line: 82, column: 9, scope: !117)
!146 = !DILocation(line: 84, column: 1, scope: !97)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !12, line: 89, type: !16)
!149 = !DILocation(line: 89, column: 12, scope: !147)
!150 = !DILocalVariable(name: "dataBadBuffer", scope: !147, file: !12, line: 90, type: !20)
!151 = !DILocation(line: 90, column: 10, scope: !147)
!152 = !DILocalVariable(name: "dataGoodBuffer", scope: !147, file: !12, line: 91, type: !25)
!153 = !DILocation(line: 91, column: 10, scope: !147)
!154 = !DILocation(line: 92, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !147, file: !12, line: 92, column: 8)
!156 = !DILocation(line: 92, column: 25, scope: !155)
!157 = !DILocation(line: 92, column: 8, scope: !147)
!158 = !DILocation(line: 95, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !12, line: 93, column: 5)
!160 = !DILocation(line: 95, column: 14, scope: !159)
!161 = !DILocation(line: 96, column: 9, scope: !159)
!162 = !DILocation(line: 96, column: 17, scope: !159)
!163 = !DILocation(line: 97, column: 5, scope: !159)
!164 = !DILocalVariable(name: "i", scope: !165, file: !12, line: 99, type: !41)
!165 = distinct !DILexicalBlock(scope: !147, file: !12, line: 98, column: 5)
!166 = !DILocation(line: 99, column: 16, scope: !165)
!167 = !DILocalVariable(name: "source", scope: !165, file: !12, line: 100, type: !25)
!168 = !DILocation(line: 100, column: 14, scope: !165)
!169 = !DILocation(line: 101, column: 9, scope: !165)
!170 = !DILocation(line: 102, column: 9, scope: !165)
!171 = !DILocation(line: 102, column: 23, scope: !165)
!172 = !DILocation(line: 104, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !165, file: !12, line: 104, column: 9)
!174 = !DILocation(line: 104, column: 14, scope: !173)
!175 = !DILocation(line: 104, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !12, line: 104, column: 9)
!177 = !DILocation(line: 104, column: 23, scope: !176)
!178 = !DILocation(line: 104, column: 9, scope: !173)
!179 = !DILocation(line: 106, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 105, column: 9)
!181 = !DILocation(line: 106, column: 23, scope: !180)
!182 = !DILocation(line: 106, column: 13, scope: !180)
!183 = !DILocation(line: 106, column: 18, scope: !180)
!184 = !DILocation(line: 106, column: 21, scope: !180)
!185 = !DILocation(line: 107, column: 9, scope: !180)
!186 = !DILocation(line: 104, column: 31, scope: !176)
!187 = !DILocation(line: 104, column: 9, scope: !176)
!188 = distinct !{!188, !178, !189, !68}
!189 = !DILocation(line: 107, column: 9, scope: !173)
!190 = !DILocation(line: 108, column: 9, scope: !165)
!191 = !DILocation(line: 108, column: 21, scope: !165)
!192 = !DILocation(line: 109, column: 19, scope: !165)
!193 = !DILocation(line: 109, column: 9, scope: !165)
!194 = !DILocation(line: 111, column: 1, scope: !147)
