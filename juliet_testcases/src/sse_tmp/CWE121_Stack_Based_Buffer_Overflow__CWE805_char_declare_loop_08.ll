; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
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
  %1 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %1, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !58
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !58
  %4 = load i8*, i8** %data, align 8, !dbg !59
  %5 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !59
  store i8 %3, i8* %arrayidx4, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %6, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !68
  store i8 0, i8* %arrayidx5, align 1, !dbg !69
  %8 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %8), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08_good() #0 !dbg !73 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !96 {
entry:
  ret i32 1, !dbg !99
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i8* %arraydecay, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx2, align 1, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %1, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !135
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !135
  %4 = load i8*, i8** %data, align 8, !dbg !136
  %5 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !136
  store i8 %3, i8* %arrayidx4, align 1, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %6, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !144
  store i8 0, i8* %arrayidx5, align 1, !dbg !145
  %8 = load i8*, i8** %data, align 8, !dbg !146
  call void @printLine(i8* %8), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !149 {
entry:
  ret i32 0, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %call = call i32 @staticReturnsTrue(), !dbg !158
  %tobool = icmp ne i32 %call, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !161
  store i8* %arraydecay, i8** %data, align 8, !dbg !163
  %0 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !164
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
  %1 = load i64, i64* %i, align 8, !dbg !178
  %cmp = icmp ult i64 %1, 100, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !184
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !184
  %4 = load i8*, i8** %data, align 8, !dbg !185
  %5 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !185
  store i8 %3, i8* %arrayidx4, align 1, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %6, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !193
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !193
  store i8 0, i8* %arrayidx5, align 1, !dbg !194
  %8 = load i8*, i8** %data, align 8, !dbg !195
  call void @printLine(i8* %8), !dbg !196
  ret void, !dbg !197
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 41, column: 10, scope: !11)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !11)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 14, scope: !33)
!35 = !DILocation(line: 47, column: 9, scope: !33)
!36 = !DILocation(line: 47, column: 17, scope: !33)
!37 = !DILocation(line: 48, column: 5, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 50, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 49, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 50, column: 16, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 51, type: !25)
!45 = !DILocation(line: 51, column: 14, scope: !39)
!46 = !DILocation(line: 52, column: 9, scope: !39)
!47 = !DILocation(line: 53, column: 9, scope: !39)
!48 = !DILocation(line: 53, column: 23, scope: !39)
!49 = !DILocation(line: 55, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !39, file: !12, line: 55, column: 9)
!51 = !DILocation(line: 55, column: 14, scope: !50)
!52 = !DILocation(line: 55, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 55, column: 9)
!54 = !DILocation(line: 55, column: 23, scope: !53)
!55 = !DILocation(line: 55, column: 9, scope: !50)
!56 = !DILocation(line: 57, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 56, column: 9)
!58 = !DILocation(line: 57, column: 23, scope: !57)
!59 = !DILocation(line: 57, column: 13, scope: !57)
!60 = !DILocation(line: 57, column: 18, scope: !57)
!61 = !DILocation(line: 57, column: 21, scope: !57)
!62 = !DILocation(line: 58, column: 9, scope: !57)
!63 = !DILocation(line: 55, column: 31, scope: !53)
!64 = !DILocation(line: 55, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 58, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 59, column: 9, scope: !39)
!69 = !DILocation(line: 59, column: 21, scope: !39)
!70 = !DILocation(line: 60, column: 19, scope: !39)
!71 = !DILocation(line: 60, column: 9, scope: !39)
!72 = !DILocation(line: 62, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_08_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 129, column: 5, scope: !73)
!75 = !DILocation(line: 130, column: 5, scope: !73)
!76 = !DILocation(line: 131, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !78, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 143, type: !80)
!83 = !DILocation(line: 143, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 143, type: !81)
!85 = !DILocation(line: 143, column: 27, scope: !77)
!86 = !DILocation(line: 146, column: 22, scope: !77)
!87 = !DILocation(line: 146, column: 12, scope: !77)
!88 = !DILocation(line: 146, column: 5, scope: !77)
!89 = !DILocation(line: 148, column: 5, scope: !77)
!90 = !DILocation(line: 149, column: 5, scope: !77)
!91 = !DILocation(line: 150, column: 5, scope: !77)
!92 = !DILocation(line: 153, column: 5, scope: !77)
!93 = !DILocation(line: 154, column: 5, scope: !77)
!94 = !DILocation(line: 155, column: 5, scope: !77)
!95 = !DILocation(line: 157, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !97, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!80}
!99 = !DILocation(line: 27, column: 5, scope: !96)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 71, type: !16)
!102 = !DILocation(line: 71, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 72, type: !20)
!104 = !DILocation(line: 72, column: 10, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 73, type: !25)
!106 = !DILocation(line: 73, column: 10, scope: !100)
!107 = !DILocation(line: 74, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 74, column: 8)
!109 = !DILocation(line: 74, column: 8, scope: !100)
!110 = !DILocation(line: 77, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 75, column: 5)
!112 = !DILocation(line: 78, column: 5, scope: !111)
!113 = !DILocation(line: 82, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !12, line: 80, column: 5)
!115 = !DILocation(line: 82, column: 14, scope: !114)
!116 = !DILocation(line: 83, column: 9, scope: !114)
!117 = !DILocation(line: 83, column: 17, scope: !114)
!118 = !DILocalVariable(name: "i", scope: !119, file: !12, line: 86, type: !40)
!119 = distinct !DILexicalBlock(scope: !100, file: !12, line: 85, column: 5)
!120 = !DILocation(line: 86, column: 16, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 87, type: !25)
!122 = !DILocation(line: 87, column: 14, scope: !119)
!123 = !DILocation(line: 88, column: 9, scope: !119)
!124 = !DILocation(line: 89, column: 9, scope: !119)
!125 = !DILocation(line: 89, column: 23, scope: !119)
!126 = !DILocation(line: 91, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !119, file: !12, line: 91, column: 9)
!128 = !DILocation(line: 91, column: 14, scope: !127)
!129 = !DILocation(line: 91, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 91, column: 9)
!131 = !DILocation(line: 91, column: 23, scope: !130)
!132 = !DILocation(line: 91, column: 9, scope: !127)
!133 = !DILocation(line: 93, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 92, column: 9)
!135 = !DILocation(line: 93, column: 23, scope: !134)
!136 = !DILocation(line: 93, column: 13, scope: !134)
!137 = !DILocation(line: 93, column: 18, scope: !134)
!138 = !DILocation(line: 93, column: 21, scope: !134)
!139 = !DILocation(line: 94, column: 9, scope: !134)
!140 = !DILocation(line: 91, column: 31, scope: !130)
!141 = !DILocation(line: 91, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !67}
!143 = !DILocation(line: 94, column: 9, scope: !127)
!144 = !DILocation(line: 95, column: 9, scope: !119)
!145 = !DILocation(line: 95, column: 21, scope: !119)
!146 = !DILocation(line: 96, column: 19, scope: !119)
!147 = !DILocation(line: 96, column: 9, scope: !119)
!148 = !DILocation(line: 98, column: 1, scope: !100)
!149 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !97, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocation(line: 32, column: 5, scope: !149)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !12, line: 103, type: !16)
!153 = !DILocation(line: 103, column: 12, scope: !151)
!154 = !DILocalVariable(name: "dataBadBuffer", scope: !151, file: !12, line: 104, type: !20)
!155 = !DILocation(line: 104, column: 10, scope: !151)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !151, file: !12, line: 105, type: !25)
!157 = !DILocation(line: 105, column: 10, scope: !151)
!158 = !DILocation(line: 106, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !12, line: 106, column: 8)
!160 = !DILocation(line: 106, column: 8, scope: !151)
!161 = !DILocation(line: 109, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 107, column: 5)
!163 = !DILocation(line: 109, column: 14, scope: !162)
!164 = !DILocation(line: 110, column: 9, scope: !162)
!165 = !DILocation(line: 110, column: 17, scope: !162)
!166 = !DILocation(line: 111, column: 5, scope: !162)
!167 = !DILocalVariable(name: "i", scope: !168, file: !12, line: 113, type: !40)
!168 = distinct !DILexicalBlock(scope: !151, file: !12, line: 112, column: 5)
!169 = !DILocation(line: 113, column: 16, scope: !168)
!170 = !DILocalVariable(name: "source", scope: !168, file: !12, line: 114, type: !25)
!171 = !DILocation(line: 114, column: 14, scope: !168)
!172 = !DILocation(line: 115, column: 9, scope: !168)
!173 = !DILocation(line: 116, column: 9, scope: !168)
!174 = !DILocation(line: 116, column: 23, scope: !168)
!175 = !DILocation(line: 118, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !168, file: !12, line: 118, column: 9)
!177 = !DILocation(line: 118, column: 14, scope: !176)
!178 = !DILocation(line: 118, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !12, line: 118, column: 9)
!180 = !DILocation(line: 118, column: 23, scope: !179)
!181 = !DILocation(line: 118, column: 9, scope: !176)
!182 = !DILocation(line: 120, column: 30, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !12, line: 119, column: 9)
!184 = !DILocation(line: 120, column: 23, scope: !183)
!185 = !DILocation(line: 120, column: 13, scope: !183)
!186 = !DILocation(line: 120, column: 18, scope: !183)
!187 = !DILocation(line: 120, column: 21, scope: !183)
!188 = !DILocation(line: 121, column: 9, scope: !183)
!189 = !DILocation(line: 118, column: 31, scope: !179)
!190 = !DILocation(line: 118, column: 9, scope: !179)
!191 = distinct !{!191, !181, !192, !67}
!192 = !DILocation(line: 121, column: 9, scope: !176)
!193 = !DILocation(line: 122, column: 9, scope: !168)
!194 = !DILocation(line: 122, column: 21, scope: !168)
!195 = !DILocation(line: 123, column: 19, scope: !168)
!196 = !DILocation(line: 123, column: 9, scope: !168)
!197 = !DILocation(line: 125, column: 1, scope: !151)
