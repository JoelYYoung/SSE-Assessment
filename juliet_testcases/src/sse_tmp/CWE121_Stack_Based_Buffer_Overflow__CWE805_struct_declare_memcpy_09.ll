; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %1, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %4, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !74
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !74
  %7 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !74
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !75
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09_good() #0 !dbg !78 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #5, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #5, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !109
  %tobool = icmp ne i32 %0, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !115
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %1, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !133
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !134
  store i32 0, i32* %intOne, align 8, !dbg !135
  %3 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !137
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !138
  store i32 0, i32* %intTwo, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %4, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !146
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !146
  %7 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !146
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !147
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !157
  %tobool = icmp ne i32 %0, 0, !dbg !157
  br i1 %tobool, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !160
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !162
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !164, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata i64* %i, metadata !167, metadata !DIExpression()), !dbg !169
  store i64 0, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !173
  %cmp = icmp ult i64 %1, 100, !dbg !175
  br i1 %cmp, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !179
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !180
  store i32 0, i32* %intOne, align 8, !dbg !181
  %3 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !183
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !184
  store i32 0, i32* %intTwo, align 4, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !187
  %inc = add i64 %4, 1, !dbg !187
  store i64 %inc, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !192
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !192
  %7 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !192
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !192
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !193
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !193
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !194
  ret void, !dbg !195
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 24, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 25, column: 19, scope: !11)
!35 = !DILocation(line: 26, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!37 = !DILocation(line: 26, column: 8, scope: !11)
!38 = !DILocation(line: 30, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 5)
!40 = !DILocation(line: 30, column: 14, scope: !39)
!41 = !DILocation(line: 31, column: 5, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 33, type: !31)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!44 = !DILocation(line: 33, column: 23, scope: !43)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 35, type: !47)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 34, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 20, scope: !46)
!51 = !DILocation(line: 37, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !12, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 18, scope: !52)
!54 = !DILocation(line: 37, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 27, scope: !55)
!57 = !DILocation(line: 37, column: 13, scope: !52)
!58 = !DILocation(line: 39, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 38, column: 13)
!60 = !DILocation(line: 39, column: 17, scope: !59)
!61 = !DILocation(line: 39, column: 27, scope: !59)
!62 = !DILocation(line: 39, column: 34, scope: !59)
!63 = !DILocation(line: 40, column: 24, scope: !59)
!64 = !DILocation(line: 40, column: 17, scope: !59)
!65 = !DILocation(line: 40, column: 27, scope: !59)
!66 = !DILocation(line: 40, column: 34, scope: !59)
!67 = !DILocation(line: 41, column: 13, scope: !59)
!68 = !DILocation(line: 37, column: 35, scope: !55)
!69 = !DILocation(line: 37, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 41, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 44, column: 16, scope: !43)
!74 = !DILocation(line: 44, column: 9, scope: !43)
!75 = !DILocation(line: 45, column: 26, scope: !43)
!76 = !DILocation(line: 45, column: 9, scope: !43)
!77 = !DILocation(line: 47, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_09_good", scope: !12, file: !12, line: 114, type: !13, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 116, column: 5, scope: !78)
!80 = !DILocation(line: 117, column: 5, scope: !78)
!81 = !DILocation(line: 118, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 130, type: !83, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DISubroutineType(types: !84)
!84 = !{!22, !22, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 130, type: !22)
!89 = !DILocation(line: 130, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 130, type: !85)
!91 = !DILocation(line: 130, column: 27, scope: !82)
!92 = !DILocation(line: 133, column: 22, scope: !82)
!93 = !DILocation(line: 133, column: 12, scope: !82)
!94 = !DILocation(line: 133, column: 5, scope: !82)
!95 = !DILocation(line: 135, column: 5, scope: !82)
!96 = !DILocation(line: 136, column: 5, scope: !82)
!97 = !DILocation(line: 137, column: 5, scope: !82)
!98 = !DILocation(line: 140, column: 5, scope: !82)
!99 = !DILocation(line: 141, column: 5, scope: !82)
!100 = !DILocation(line: 142, column: 5, scope: !82)
!101 = !DILocation(line: 144, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 56, type: !16)
!104 = !DILocation(line: 56, column: 21, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !12, line: 57, type: !26)
!106 = !DILocation(line: 57, column: 19, scope: !102)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !12, line: 58, type: !31)
!108 = !DILocation(line: 58, column: 19, scope: !102)
!109 = !DILocation(line: 59, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 59, column: 8)
!111 = !DILocation(line: 59, column: 8, scope: !102)
!112 = !DILocation(line: 62, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !12, line: 60, column: 5)
!114 = !DILocation(line: 63, column: 5, scope: !113)
!115 = !DILocation(line: 67, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !12, line: 65, column: 5)
!117 = !DILocation(line: 67, column: 14, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 70, type: !31)
!119 = distinct !DILexicalBlock(scope: !102, file: !12, line: 69, column: 5)
!120 = !DILocation(line: 70, column: 23, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !12, line: 72, type: !47)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 71, column: 9)
!123 = !DILocation(line: 72, column: 20, scope: !122)
!124 = !DILocation(line: 74, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 74, column: 13)
!126 = !DILocation(line: 74, column: 18, scope: !125)
!127 = !DILocation(line: 74, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 74, column: 13)
!129 = !DILocation(line: 74, column: 27, scope: !128)
!130 = !DILocation(line: 74, column: 13, scope: !125)
!131 = !DILocation(line: 76, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 75, column: 13)
!133 = !DILocation(line: 76, column: 17, scope: !132)
!134 = !DILocation(line: 76, column: 27, scope: !132)
!135 = !DILocation(line: 76, column: 34, scope: !132)
!136 = !DILocation(line: 77, column: 24, scope: !132)
!137 = !DILocation(line: 77, column: 17, scope: !132)
!138 = !DILocation(line: 77, column: 27, scope: !132)
!139 = !DILocation(line: 77, column: 34, scope: !132)
!140 = !DILocation(line: 78, column: 13, scope: !132)
!141 = !DILocation(line: 74, column: 35, scope: !128)
!142 = !DILocation(line: 74, column: 13, scope: !128)
!143 = distinct !{!143, !130, !144, !72}
!144 = !DILocation(line: 78, column: 13, scope: !125)
!145 = !DILocation(line: 81, column: 16, scope: !119)
!146 = !DILocation(line: 81, column: 9, scope: !119)
!147 = !DILocation(line: 82, column: 26, scope: !119)
!148 = !DILocation(line: 82, column: 9, scope: !119)
!149 = !DILocation(line: 84, column: 1, scope: !102)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", scope: !150, file: !12, line: 89, type: !16)
!152 = !DILocation(line: 89, column: 21, scope: !150)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !150, file: !12, line: 90, type: !26)
!154 = !DILocation(line: 90, column: 19, scope: !150)
!155 = !DILocalVariable(name: "dataGoodBuffer", scope: !150, file: !12, line: 91, type: !31)
!156 = !DILocation(line: 91, column: 19, scope: !150)
!157 = !DILocation(line: 92, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !150, file: !12, line: 92, column: 8)
!159 = !DILocation(line: 92, column: 8, scope: !150)
!160 = !DILocation(line: 95, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 93, column: 5)
!162 = !DILocation(line: 95, column: 14, scope: !161)
!163 = !DILocation(line: 96, column: 5, scope: !161)
!164 = !DILocalVariable(name: "source", scope: !165, file: !12, line: 98, type: !31)
!165 = distinct !DILexicalBlock(scope: !150, file: !12, line: 97, column: 5)
!166 = !DILocation(line: 98, column: 23, scope: !165)
!167 = !DILocalVariable(name: "i", scope: !168, file: !12, line: 100, type: !47)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 99, column: 9)
!169 = !DILocation(line: 100, column: 20, scope: !168)
!170 = !DILocation(line: 102, column: 20, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 102, column: 13)
!172 = !DILocation(line: 102, column: 18, scope: !171)
!173 = !DILocation(line: 102, column: 25, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !12, line: 102, column: 13)
!175 = !DILocation(line: 102, column: 27, scope: !174)
!176 = !DILocation(line: 102, column: 13, scope: !171)
!177 = !DILocation(line: 104, column: 24, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !12, line: 103, column: 13)
!179 = !DILocation(line: 104, column: 17, scope: !178)
!180 = !DILocation(line: 104, column: 27, scope: !178)
!181 = !DILocation(line: 104, column: 34, scope: !178)
!182 = !DILocation(line: 105, column: 24, scope: !178)
!183 = !DILocation(line: 105, column: 17, scope: !178)
!184 = !DILocation(line: 105, column: 27, scope: !178)
!185 = !DILocation(line: 105, column: 34, scope: !178)
!186 = !DILocation(line: 106, column: 13, scope: !178)
!187 = !DILocation(line: 102, column: 35, scope: !174)
!188 = !DILocation(line: 102, column: 13, scope: !174)
!189 = distinct !{!189, !176, !190, !72}
!190 = !DILocation(line: 106, column: 13, scope: !171)
!191 = !DILocation(line: 109, column: 16, scope: !165)
!192 = !DILocation(line: 109, column: 9, scope: !165)
!193 = !DILocation(line: 110, column: 26, scope: !165)
!194 = !DILocation(line: 110, column: 9, scope: !165)
!195 = !DILocation(line: 112, column: 1, scope: !150)
