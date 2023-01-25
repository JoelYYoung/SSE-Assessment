; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @globalFive, align 4, !dbg !35
  %cmp = icmp eq i32 %0, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !55
  %cmp1 = icmp ult i64 %1, 100, !dbg !57
  br i1 %cmp1, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %3 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %4, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !75
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !75
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !75
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !76
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = load i32, i32* @globalFive, align 4, !dbg !110
  %cmp = icmp ne i32 %0, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !129
  %cmp1 = icmp ult i64 %1, 100, !dbg !131
  br i1 %cmp1, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !135
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !136
  store i32 0, i32* %intOne, align 8, !dbg !137
  %3 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !139
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !140
  store i32 0, i32* %intTwo, align 4, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %4, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !148
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !148
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !148
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !148
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !149
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %0 = load i32, i32* @globalFive, align 4, !dbg !159
  %cmp = icmp eq i32 %0, 5, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !163
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !167, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !176
  %cmp1 = icmp ult i64 %1, 100, !dbg !178
  br i1 %cmp1, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !182
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !183
  store i32 0, i32* %intOne, align 8, !dbg !184
  %3 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !186
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !187
  store i32 0, i32* %intTwo, align 4, !dbg !188
  br label %for.inc, !dbg !189

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !190
  %inc = add i64 %4, 1, !dbg !190
  store i64 %inc, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !191, !llvm.loop !192

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !194
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !195
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !195
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !195
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !195
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !196
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !197
  ret void, !dbg !198
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!37 = !DILocation(line: 26, column: 18, scope: !36)
!38 = !DILocation(line: 26, column: 8, scope: !11)
!39 = !DILocation(line: 30, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 27, column: 5)
!41 = !DILocation(line: 30, column: 14, scope: !40)
!42 = !DILocation(line: 31, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 33, type: !31)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!45 = !DILocation(line: 33, column: 23, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 35, type: !48)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 34, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 20, scope: !47)
!52 = !DILocation(line: 37, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !12, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 27, scope: !56)
!58 = !DILocation(line: 37, column: 13, scope: !53)
!59 = !DILocation(line: 39, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 38, column: 13)
!61 = !DILocation(line: 39, column: 17, scope: !60)
!62 = !DILocation(line: 39, column: 27, scope: !60)
!63 = !DILocation(line: 39, column: 34, scope: !60)
!64 = !DILocation(line: 40, column: 24, scope: !60)
!65 = !DILocation(line: 40, column: 17, scope: !60)
!66 = !DILocation(line: 40, column: 27, scope: !60)
!67 = !DILocation(line: 40, column: 34, scope: !60)
!68 = !DILocation(line: 41, column: 13, scope: !60)
!69 = !DILocation(line: 37, column: 35, scope: !56)
!70 = !DILocation(line: 37, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 41, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 44, column: 16, scope: !44)
!75 = !DILocation(line: 44, column: 9, scope: !44)
!76 = !DILocation(line: 45, column: 26, scope: !44)
!77 = !DILocation(line: 45, column: 9, scope: !44)
!78 = !DILocation(line: 47, column: 1, scope: !11)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_good", scope: !12, file: !12, line: 114, type: !13, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 116, column: 5, scope: !79)
!81 = !DILocation(line: 117, column: 5, scope: !79)
!82 = !DILocation(line: 118, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 130, type: !84, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!22, !22, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 130, type: !22)
!90 = !DILocation(line: 130, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 130, type: !86)
!92 = !DILocation(line: 130, column: 27, scope: !83)
!93 = !DILocation(line: 133, column: 22, scope: !83)
!94 = !DILocation(line: 133, column: 12, scope: !83)
!95 = !DILocation(line: 133, column: 5, scope: !83)
!96 = !DILocation(line: 135, column: 5, scope: !83)
!97 = !DILocation(line: 136, column: 5, scope: !83)
!98 = !DILocation(line: 137, column: 5, scope: !83)
!99 = !DILocation(line: 140, column: 5, scope: !83)
!100 = !DILocation(line: 141, column: 5, scope: !83)
!101 = !DILocation(line: 142, column: 5, scope: !83)
!102 = !DILocation(line: 144, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 56, type: !16)
!105 = !DILocation(line: 56, column: 21, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 57, type: !26)
!107 = !DILocation(line: 57, column: 19, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 58, type: !31)
!109 = !DILocation(line: 58, column: 19, scope: !103)
!110 = !DILocation(line: 59, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 59, column: 8)
!112 = !DILocation(line: 59, column: 18, scope: !111)
!113 = !DILocation(line: 59, column: 8, scope: !103)
!114 = !DILocation(line: 62, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !12, line: 60, column: 5)
!116 = !DILocation(line: 63, column: 5, scope: !115)
!117 = !DILocation(line: 67, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !12, line: 65, column: 5)
!119 = !DILocation(line: 67, column: 14, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 70, type: !31)
!121 = distinct !DILexicalBlock(scope: !103, file: !12, line: 69, column: 5)
!122 = !DILocation(line: 70, column: 23, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 72, type: !48)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 71, column: 9)
!125 = !DILocation(line: 72, column: 20, scope: !124)
!126 = !DILocation(line: 74, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 74, column: 13)
!128 = !DILocation(line: 74, column: 18, scope: !127)
!129 = !DILocation(line: 74, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 74, column: 13)
!131 = !DILocation(line: 74, column: 27, scope: !130)
!132 = !DILocation(line: 74, column: 13, scope: !127)
!133 = !DILocation(line: 76, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 75, column: 13)
!135 = !DILocation(line: 76, column: 17, scope: !134)
!136 = !DILocation(line: 76, column: 27, scope: !134)
!137 = !DILocation(line: 76, column: 34, scope: !134)
!138 = !DILocation(line: 77, column: 24, scope: !134)
!139 = !DILocation(line: 77, column: 17, scope: !134)
!140 = !DILocation(line: 77, column: 27, scope: !134)
!141 = !DILocation(line: 77, column: 34, scope: !134)
!142 = !DILocation(line: 78, column: 13, scope: !134)
!143 = !DILocation(line: 74, column: 35, scope: !130)
!144 = !DILocation(line: 74, column: 13, scope: !130)
!145 = distinct !{!145, !132, !146, !73}
!146 = !DILocation(line: 78, column: 13, scope: !127)
!147 = !DILocation(line: 81, column: 16, scope: !121)
!148 = !DILocation(line: 81, column: 9, scope: !121)
!149 = !DILocation(line: 82, column: 26, scope: !121)
!150 = !DILocation(line: 82, column: 9, scope: !121)
!151 = !DILocation(line: 84, column: 1, scope: !103)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!153 = !DILocalVariable(name: "data", scope: !152, file: !12, line: 89, type: !16)
!154 = !DILocation(line: 89, column: 21, scope: !152)
!155 = !DILocalVariable(name: "dataBadBuffer", scope: !152, file: !12, line: 90, type: !26)
!156 = !DILocation(line: 90, column: 19, scope: !152)
!157 = !DILocalVariable(name: "dataGoodBuffer", scope: !152, file: !12, line: 91, type: !31)
!158 = !DILocation(line: 91, column: 19, scope: !152)
!159 = !DILocation(line: 92, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !152, file: !12, line: 92, column: 8)
!161 = !DILocation(line: 92, column: 18, scope: !160)
!162 = !DILocation(line: 92, column: 8, scope: !152)
!163 = !DILocation(line: 95, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !12, line: 93, column: 5)
!165 = !DILocation(line: 95, column: 14, scope: !164)
!166 = !DILocation(line: 96, column: 5, scope: !164)
!167 = !DILocalVariable(name: "source", scope: !168, file: !12, line: 98, type: !31)
!168 = distinct !DILexicalBlock(scope: !152, file: !12, line: 97, column: 5)
!169 = !DILocation(line: 98, column: 23, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !171, file: !12, line: 100, type: !48)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 99, column: 9)
!172 = !DILocation(line: 100, column: 20, scope: !171)
!173 = !DILocation(line: 102, column: 20, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !12, line: 102, column: 13)
!175 = !DILocation(line: 102, column: 18, scope: !174)
!176 = !DILocation(line: 102, column: 25, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !12, line: 102, column: 13)
!178 = !DILocation(line: 102, column: 27, scope: !177)
!179 = !DILocation(line: 102, column: 13, scope: !174)
!180 = !DILocation(line: 104, column: 24, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !12, line: 103, column: 13)
!182 = !DILocation(line: 104, column: 17, scope: !181)
!183 = !DILocation(line: 104, column: 27, scope: !181)
!184 = !DILocation(line: 104, column: 34, scope: !181)
!185 = !DILocation(line: 105, column: 24, scope: !181)
!186 = !DILocation(line: 105, column: 17, scope: !181)
!187 = !DILocation(line: 105, column: 27, scope: !181)
!188 = !DILocation(line: 105, column: 34, scope: !181)
!189 = !DILocation(line: 106, column: 13, scope: !181)
!190 = !DILocation(line: 102, column: 35, scope: !177)
!191 = !DILocation(line: 102, column: 13, scope: !177)
!192 = distinct !{!192, !179, !193, !73}
!193 = !DILocation(line: 106, column: 13, scope: !174)
!194 = !DILocation(line: 109, column: 16, scope: !168)
!195 = !DILocation(line: 109, column: 9, scope: !168)
!196 = !DILocation(line: 110, column: 26, scope: !168)
!197 = !DILocation(line: 110, column: 9, scope: !168)
!198 = !DILocation(line: 112, column: 1, scope: !152)
