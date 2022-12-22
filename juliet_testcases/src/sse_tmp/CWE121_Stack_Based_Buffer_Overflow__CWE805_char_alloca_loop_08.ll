; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
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
  %4 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %4, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !57
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %7 = load i8*, i8** %data, align 8, !dbg !58
  %8 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !58
  store i8 %6, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %9, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !67
  store i8 0, i8* %arrayidx4, align 1, !dbg !68
  %11 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %11), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08_good() #0 !dbg !72 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !95 {
entry:
  ret i32 1, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 50, align 16, !dbg !104
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %1 = alloca i8, i64 100, align 16, !dbg !107
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !106
  %call = call i32 @staticReturnsFalse(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  store i8* %2, i8** %data, align 8, !dbg !116
  %3 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx1, align 1, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %4, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !136
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !136
  %7 = load i8*, i8** %data, align 8, !dbg !137
  %8 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !137
  store i8 %6, i8* %arrayidx3, align 1, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %9, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !145
  store i8 0, i8* %arrayidx4, align 1, !dbg !146
  %11 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %11), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !150 {
entry:
  ret i32 0, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %0 = alloca i8, i64 50, align 16, !dbg !157
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %1 = alloca i8, i64 100, align 16, !dbg !160
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !159
  %call = call i32 @staticReturnsTrue(), !dbg !161
  %tobool = icmp ne i32 %call, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !164
  store i8* %2, i8** %data, align 8, !dbg !166
  %3 = load i8*, i8** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !175
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !176
  store i8 0, i8* %arrayidx1, align 1, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !181
  %cmp = icmp ult i64 %4, 100, !dbg !183
  br i1 %cmp, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !187
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !187
  %7 = load i8*, i8** %data, align 8, !dbg !188
  %8 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !188
  store i8 %6, i8* %arrayidx3, align 1, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %9, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !196
  store i8 0, i8* %arrayidx4, align 1, !dbg !197
  %11 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* %11), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 41, type: !4)
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocation(line: 41, column: 37, scope: !13)
!25 = !DILocation(line: 42, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 8)
!27 = !DILocation(line: 42, column: 8, scope: !13)
!28 = !DILocation(line: 46, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 43, column: 5)
!30 = !DILocation(line: 46, column: 14, scope: !29)
!31 = !DILocation(line: 47, column: 9, scope: !29)
!32 = !DILocation(line: 47, column: 17, scope: !29)
!33 = !DILocation(line: 48, column: 5, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 50, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 49, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 50, column: 16, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 51, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 51, column: 14, scope: !35)
!45 = !DILocation(line: 52, column: 9, scope: !35)
!46 = !DILocation(line: 53, column: 9, scope: !35)
!47 = !DILocation(line: 53, column: 23, scope: !35)
!48 = !DILocation(line: 55, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !14, line: 55, column: 9)
!50 = !DILocation(line: 55, column: 14, scope: !49)
!51 = !DILocation(line: 55, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 55, column: 9)
!53 = !DILocation(line: 55, column: 23, scope: !52)
!54 = !DILocation(line: 55, column: 9, scope: !49)
!55 = !DILocation(line: 57, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 56, column: 9)
!57 = !DILocation(line: 57, column: 23, scope: !56)
!58 = !DILocation(line: 57, column: 13, scope: !56)
!59 = !DILocation(line: 57, column: 18, scope: !56)
!60 = !DILocation(line: 57, column: 21, scope: !56)
!61 = !DILocation(line: 58, column: 9, scope: !56)
!62 = !DILocation(line: 55, column: 31, scope: !52)
!63 = !DILocation(line: 55, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 58, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 59, column: 9, scope: !35)
!68 = !DILocation(line: 59, column: 21, scope: !35)
!69 = !DILocation(line: 60, column: 19, scope: !35)
!70 = !DILocation(line: 60, column: 9, scope: !35)
!71 = !DILocation(line: 62, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_08_good", scope: !14, file: !14, line: 127, type: !15, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 129, column: 5, scope: !72)
!74 = !DILocation(line: 130, column: 5, scope: !72)
!75 = !DILocation(line: 131, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 143, type: !77, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 143, type: !79)
!82 = !DILocation(line: 143, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 143, type: !80)
!84 = !DILocation(line: 143, column: 27, scope: !76)
!85 = !DILocation(line: 146, column: 22, scope: !76)
!86 = !DILocation(line: 146, column: 12, scope: !76)
!87 = !DILocation(line: 146, column: 5, scope: !76)
!88 = !DILocation(line: 148, column: 5, scope: !76)
!89 = !DILocation(line: 149, column: 5, scope: !76)
!90 = !DILocation(line: 150, column: 5, scope: !76)
!91 = !DILocation(line: 153, column: 5, scope: !76)
!92 = !DILocation(line: 154, column: 5, scope: !76)
!93 = !DILocation(line: 155, column: 5, scope: !76)
!94 = !DILocation(line: 157, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !96, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!79}
!98 = !DILocation(line: 27, column: 5, scope: !95)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 71, type: !4)
!101 = !DILocation(line: 71, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !14, line: 72, type: !4)
!103 = !DILocation(line: 72, column: 12, scope: !99)
!104 = !DILocation(line: 72, column: 36, scope: !99)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !14, line: 73, type: !4)
!106 = !DILocation(line: 73, column: 12, scope: !99)
!107 = !DILocation(line: 73, column: 37, scope: !99)
!108 = !DILocation(line: 74, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !99, file: !14, line: 74, column: 8)
!110 = !DILocation(line: 74, column: 8, scope: !99)
!111 = !DILocation(line: 77, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !14, line: 75, column: 5)
!113 = !DILocation(line: 78, column: 5, scope: !112)
!114 = !DILocation(line: 82, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !14, line: 80, column: 5)
!116 = !DILocation(line: 82, column: 14, scope: !115)
!117 = !DILocation(line: 83, column: 9, scope: !115)
!118 = !DILocation(line: 83, column: 17, scope: !115)
!119 = !DILocalVariable(name: "i", scope: !120, file: !14, line: 86, type: !36)
!120 = distinct !DILexicalBlock(scope: !99, file: !14, line: 85, column: 5)
!121 = !DILocation(line: 86, column: 16, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !120, file: !14, line: 87, type: !41)
!123 = !DILocation(line: 87, column: 14, scope: !120)
!124 = !DILocation(line: 88, column: 9, scope: !120)
!125 = !DILocation(line: 89, column: 9, scope: !120)
!126 = !DILocation(line: 89, column: 23, scope: !120)
!127 = !DILocation(line: 91, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !14, line: 91, column: 9)
!129 = !DILocation(line: 91, column: 14, scope: !128)
!130 = !DILocation(line: 91, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !14, line: 91, column: 9)
!132 = !DILocation(line: 91, column: 23, scope: !131)
!133 = !DILocation(line: 91, column: 9, scope: !128)
!134 = !DILocation(line: 93, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !14, line: 92, column: 9)
!136 = !DILocation(line: 93, column: 23, scope: !135)
!137 = !DILocation(line: 93, column: 13, scope: !135)
!138 = !DILocation(line: 93, column: 18, scope: !135)
!139 = !DILocation(line: 93, column: 21, scope: !135)
!140 = !DILocation(line: 94, column: 9, scope: !135)
!141 = !DILocation(line: 91, column: 31, scope: !131)
!142 = !DILocation(line: 91, column: 9, scope: !131)
!143 = distinct !{!143, !133, !144, !66}
!144 = !DILocation(line: 94, column: 9, scope: !128)
!145 = !DILocation(line: 95, column: 9, scope: !120)
!146 = !DILocation(line: 95, column: 21, scope: !120)
!147 = !DILocation(line: 96, column: 19, scope: !120)
!148 = !DILocation(line: 96, column: 9, scope: !120)
!149 = !DILocation(line: 98, column: 1, scope: !99)
!150 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !96, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocation(line: 32, column: 5, scope: !150)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !14, line: 103, type: !4)
!154 = !DILocation(line: 103, column: 12, scope: !152)
!155 = !DILocalVariable(name: "dataBadBuffer", scope: !152, file: !14, line: 104, type: !4)
!156 = !DILocation(line: 104, column: 12, scope: !152)
!157 = !DILocation(line: 104, column: 36, scope: !152)
!158 = !DILocalVariable(name: "dataGoodBuffer", scope: !152, file: !14, line: 105, type: !4)
!159 = !DILocation(line: 105, column: 12, scope: !152)
!160 = !DILocation(line: 105, column: 37, scope: !152)
!161 = !DILocation(line: 106, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !152, file: !14, line: 106, column: 8)
!163 = !DILocation(line: 106, column: 8, scope: !152)
!164 = !DILocation(line: 109, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !14, line: 107, column: 5)
!166 = !DILocation(line: 109, column: 14, scope: !165)
!167 = !DILocation(line: 110, column: 9, scope: !165)
!168 = !DILocation(line: 110, column: 17, scope: !165)
!169 = !DILocation(line: 111, column: 5, scope: !165)
!170 = !DILocalVariable(name: "i", scope: !171, file: !14, line: 113, type: !36)
!171 = distinct !DILexicalBlock(scope: !152, file: !14, line: 112, column: 5)
!172 = !DILocation(line: 113, column: 16, scope: !171)
!173 = !DILocalVariable(name: "source", scope: !171, file: !14, line: 114, type: !41)
!174 = !DILocation(line: 114, column: 14, scope: !171)
!175 = !DILocation(line: 115, column: 9, scope: !171)
!176 = !DILocation(line: 116, column: 9, scope: !171)
!177 = !DILocation(line: 116, column: 23, scope: !171)
!178 = !DILocation(line: 118, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !171, file: !14, line: 118, column: 9)
!180 = !DILocation(line: 118, column: 14, scope: !179)
!181 = !DILocation(line: 118, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !14, line: 118, column: 9)
!183 = !DILocation(line: 118, column: 23, scope: !182)
!184 = !DILocation(line: 118, column: 9, scope: !179)
!185 = !DILocation(line: 120, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !14, line: 119, column: 9)
!187 = !DILocation(line: 120, column: 23, scope: !186)
!188 = !DILocation(line: 120, column: 13, scope: !186)
!189 = !DILocation(line: 120, column: 18, scope: !186)
!190 = !DILocation(line: 120, column: 21, scope: !186)
!191 = !DILocation(line: 121, column: 9, scope: !186)
!192 = !DILocation(line: 118, column: 31, scope: !182)
!193 = !DILocation(line: 118, column: 9, scope: !182)
!194 = distinct !{!194, !184, !195, !66}
!195 = !DILocation(line: 121, column: 9, scope: !179)
!196 = !DILocation(line: 122, column: 9, scope: !171)
!197 = !DILocation(line: 122, column: 21, scope: !171)
!198 = !DILocation(line: 123, column: 19, scope: !171)
!199 = !DILocation(line: 123, column: 9, scope: !171)
!200 = !DILocation(line: 125, column: 1, scope: !152)
