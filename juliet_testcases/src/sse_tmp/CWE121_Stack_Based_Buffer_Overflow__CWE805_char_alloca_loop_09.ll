; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !25
  %tobool = icmp ne i32 %2, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %3, i8** %data, align 8, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %5, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !57
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %8 = load i8*, i8** %data, align 8, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !58
  store i8 %7, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !67
  store i8 0, i8* %arrayidx4, align 1, !dbg !68
  %12 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %12), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 50, align 16, !dbg !100
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %1 = alloca i8, i64 100, align 16, !dbg !103
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !102
  %2 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !104
  %tobool = icmp ne i32 %2, 0, !dbg !104
  br i1 %tobool, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !107
  br label %if.end, !dbg !109

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !110
  store i8* %3, i8** %data, align 8, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx1, align 1, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %5, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !132
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !132
  %8 = load i8*, i8** %data, align 8, !dbg !133
  %9 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !133
  store i8 %7, i8* %arrayidx3, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %10, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  %12 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* %12), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = alloca i8, i64 50, align 16, !dbg !151
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %1 = alloca i8, i64 100, align 16, !dbg !154
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !153
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !155
  %tobool = icmp ne i32 %2, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !158
  store i8* %3, i8** %data, align 8, !dbg !160
  %4 = load i8*, i8** %data, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !162
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !169
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx1, align 1, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !175
  %cmp = icmp ult i64 %5, 100, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %6, !dbg !181
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !181
  %8 = load i8*, i8** %data, align 8, !dbg !182
  %9 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !182
  store i8 %7, i8* %arrayidx3, align 1, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %10, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !190
  %arrayidx4 = getelementptr inbounds i8, i8* %11, i64 99, !dbg !190
  store i8 0, i8* %arrayidx4, align 1, !dbg !191
  %12 = load i8*, i8** %data, align 8, !dbg !192
  call void @printLine(i8* %12), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 32, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 14, scope: !29)
!31 = !DILocation(line: 33, column: 9, scope: !29)
!32 = !DILocation(line: 33, column: 17, scope: !29)
!33 = !DILocation(line: 34, column: 5, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 36, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 36, column: 16, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 37, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 37, column: 14, scope: !35)
!45 = !DILocation(line: 38, column: 9, scope: !35)
!46 = !DILocation(line: 39, column: 9, scope: !35)
!47 = !DILocation(line: 39, column: 23, scope: !35)
!48 = !DILocation(line: 41, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !14, line: 41, column: 9)
!50 = !DILocation(line: 41, column: 14, scope: !49)
!51 = !DILocation(line: 41, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 41, column: 9)
!53 = !DILocation(line: 41, column: 23, scope: !52)
!54 = !DILocation(line: 41, column: 9, scope: !49)
!55 = !DILocation(line: 43, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 42, column: 9)
!57 = !DILocation(line: 43, column: 23, scope: !56)
!58 = !DILocation(line: 43, column: 13, scope: !56)
!59 = !DILocation(line: 43, column: 18, scope: !56)
!60 = !DILocation(line: 43, column: 21, scope: !56)
!61 = !DILocation(line: 44, column: 9, scope: !56)
!62 = !DILocation(line: 41, column: 31, scope: !52)
!63 = !DILocation(line: 41, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 44, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 45, column: 9, scope: !35)
!68 = !DILocation(line: 45, column: 21, scope: !35)
!69 = !DILocation(line: 46, column: 19, scope: !35)
!70 = !DILocation(line: 46, column: 9, scope: !35)
!71 = !DILocation(line: 48, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_09_good", scope: !14, file: !14, line: 113, type: !15, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 115, column: 5, scope: !72)
!74 = !DILocation(line: 116, column: 5, scope: !72)
!75 = !DILocation(line: 117, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 129, type: !77, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 129, type: !79)
!82 = !DILocation(line: 129, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 129, type: !80)
!84 = !DILocation(line: 129, column: 27, scope: !76)
!85 = !DILocation(line: 132, column: 22, scope: !76)
!86 = !DILocation(line: 132, column: 12, scope: !76)
!87 = !DILocation(line: 132, column: 5, scope: !76)
!88 = !DILocation(line: 134, column: 5, scope: !76)
!89 = !DILocation(line: 135, column: 5, scope: !76)
!90 = !DILocation(line: 136, column: 5, scope: !76)
!91 = !DILocation(line: 139, column: 5, scope: !76)
!92 = !DILocation(line: 140, column: 5, scope: !76)
!93 = !DILocation(line: 141, column: 5, scope: !76)
!94 = !DILocation(line: 143, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 57, type: !4)
!97 = !DILocation(line: 57, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !14, line: 58, type: !4)
!99 = !DILocation(line: 58, column: 12, scope: !95)
!100 = !DILocation(line: 58, column: 36, scope: !95)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !14, line: 59, type: !4)
!102 = !DILocation(line: 59, column: 12, scope: !95)
!103 = !DILocation(line: 59, column: 37, scope: !95)
!104 = !DILocation(line: 60, column: 8, scope: !105)
!105 = distinct !DILexicalBlock(scope: !95, file: !14, line: 60, column: 8)
!106 = !DILocation(line: 60, column: 8, scope: !95)
!107 = !DILocation(line: 63, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !14, line: 61, column: 5)
!109 = !DILocation(line: 64, column: 5, scope: !108)
!110 = !DILocation(line: 68, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !14, line: 66, column: 5)
!112 = !DILocation(line: 68, column: 14, scope: !111)
!113 = !DILocation(line: 69, column: 9, scope: !111)
!114 = !DILocation(line: 69, column: 17, scope: !111)
!115 = !DILocalVariable(name: "i", scope: !116, file: !14, line: 72, type: !36)
!116 = distinct !DILexicalBlock(scope: !95, file: !14, line: 71, column: 5)
!117 = !DILocation(line: 72, column: 16, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !14, line: 73, type: !41)
!119 = !DILocation(line: 73, column: 14, scope: !116)
!120 = !DILocation(line: 74, column: 9, scope: !116)
!121 = !DILocation(line: 75, column: 9, scope: !116)
!122 = !DILocation(line: 75, column: 23, scope: !116)
!123 = !DILocation(line: 77, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !14, line: 77, column: 9)
!125 = !DILocation(line: 77, column: 14, scope: !124)
!126 = !DILocation(line: 77, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !14, line: 77, column: 9)
!128 = !DILocation(line: 77, column: 23, scope: !127)
!129 = !DILocation(line: 77, column: 9, scope: !124)
!130 = !DILocation(line: 79, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !14, line: 78, column: 9)
!132 = !DILocation(line: 79, column: 23, scope: !131)
!133 = !DILocation(line: 79, column: 13, scope: !131)
!134 = !DILocation(line: 79, column: 18, scope: !131)
!135 = !DILocation(line: 79, column: 21, scope: !131)
!136 = !DILocation(line: 80, column: 9, scope: !131)
!137 = !DILocation(line: 77, column: 31, scope: !127)
!138 = !DILocation(line: 77, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !66}
!140 = !DILocation(line: 80, column: 9, scope: !124)
!141 = !DILocation(line: 81, column: 9, scope: !116)
!142 = !DILocation(line: 81, column: 21, scope: !116)
!143 = !DILocation(line: 82, column: 19, scope: !116)
!144 = !DILocation(line: 82, column: 9, scope: !116)
!145 = !DILocation(line: 84, column: 1, scope: !95)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !14, line: 89, type: !4)
!148 = !DILocation(line: 89, column: 12, scope: !146)
!149 = !DILocalVariable(name: "dataBadBuffer", scope: !146, file: !14, line: 90, type: !4)
!150 = !DILocation(line: 90, column: 12, scope: !146)
!151 = !DILocation(line: 90, column: 36, scope: !146)
!152 = !DILocalVariable(name: "dataGoodBuffer", scope: !146, file: !14, line: 91, type: !4)
!153 = !DILocation(line: 91, column: 12, scope: !146)
!154 = !DILocation(line: 91, column: 37, scope: !146)
!155 = !DILocation(line: 92, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !146, file: !14, line: 92, column: 8)
!157 = !DILocation(line: 92, column: 8, scope: !146)
!158 = !DILocation(line: 95, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !14, line: 93, column: 5)
!160 = !DILocation(line: 95, column: 14, scope: !159)
!161 = !DILocation(line: 96, column: 9, scope: !159)
!162 = !DILocation(line: 96, column: 17, scope: !159)
!163 = !DILocation(line: 97, column: 5, scope: !159)
!164 = !DILocalVariable(name: "i", scope: !165, file: !14, line: 99, type: !36)
!165 = distinct !DILexicalBlock(scope: !146, file: !14, line: 98, column: 5)
!166 = !DILocation(line: 99, column: 16, scope: !165)
!167 = !DILocalVariable(name: "source", scope: !165, file: !14, line: 100, type: !41)
!168 = !DILocation(line: 100, column: 14, scope: !165)
!169 = !DILocation(line: 101, column: 9, scope: !165)
!170 = !DILocation(line: 102, column: 9, scope: !165)
!171 = !DILocation(line: 102, column: 23, scope: !165)
!172 = !DILocation(line: 104, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !165, file: !14, line: 104, column: 9)
!174 = !DILocation(line: 104, column: 14, scope: !173)
!175 = !DILocation(line: 104, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !14, line: 104, column: 9)
!177 = !DILocation(line: 104, column: 23, scope: !176)
!178 = !DILocation(line: 104, column: 9, scope: !173)
!179 = !DILocation(line: 106, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !14, line: 105, column: 9)
!181 = !DILocation(line: 106, column: 23, scope: !180)
!182 = !DILocation(line: 106, column: 13, scope: !180)
!183 = !DILocation(line: 106, column: 18, scope: !180)
!184 = !DILocation(line: 106, column: 21, scope: !180)
!185 = !DILocation(line: 107, column: 9, scope: !180)
!186 = !DILocation(line: 104, column: 31, scope: !176)
!187 = !DILocation(line: 104, column: 9, scope: !176)
!188 = distinct !{!188, !178, !189, !66}
!189 = !DILocation(line: 107, column: 9, scope: !173)
!190 = !DILocation(line: 108, column: 9, scope: !165)
!191 = !DILocation(line: 108, column: 21, scope: !165)
!192 = !DILocation(line: 109, column: 19, scope: !165)
!193 = !DILocation(line: 109, column: 9, scope: !165)
!194 = !DILocation(line: 111, column: 1, scope: !146)
