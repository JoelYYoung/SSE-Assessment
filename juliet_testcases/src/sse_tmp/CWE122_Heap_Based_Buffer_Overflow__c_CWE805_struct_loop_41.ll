; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_badSink(%struct._twoIntsStruct* %data) #0 !dbg !20 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %cmp = icmp ult i64 %0, 100, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !47
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !48
  store i32 0, i32* %intOne, align 8, !dbg !49
  %2 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !51
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !52
  store i32 0, i32* %intTwo, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %3, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !60, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i2, align 8, !dbg !63
  br label %for.cond3, !dbg !65

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !66
  %cmp4 = icmp ult i64 %4, 100, !dbg !68
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !69

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !70
  %6 = load i64, i64* %i2, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !70
  %7 = load i64, i64* %i2, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !74
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !74
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !74
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !74
  br label %for.inc8, !dbg !75

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !76
  %inc9 = add i64 %10, 1, !dbg !76
  store i64 %inc9, i64* %i2, align 8, !dbg !76
  br label %for.cond3, !dbg !77, !llvm.loop !78

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !80
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !80
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !81
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !82
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !82
  call void @free(i8* %13) #6, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_bad() #0 !dbg !85 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !91
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !92
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_badSink(%struct._twoIntsStruct* %2), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !103 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %0, 100, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !121
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !122
  store i32 0, i32* %intOne, align 8, !dbg !123
  %2 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !125
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !126
  store i32 0, i32* %intTwo, align 4, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %3, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !133, metadata !DIExpression()), !dbg !135
  store i64 0, i64* %i2, align 8, !dbg !136
  br label %for.cond3, !dbg !138

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !139
  %cmp4 = icmp ult i64 %4, 100, !dbg !141
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !142

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !143
  %6 = load i64, i64* %i2, align 8, !dbg !145
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !143
  %7 = load i64, i64* %i2, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !147
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !147
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !147
  br label %for.inc8, !dbg !148

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !149
  %inc9 = add i64 %10, 1, !dbg !149
  store i64 %inc9, i64* %i2, align 8, !dbg !149
  br label %for.cond3, !dbg !150, !llvm.loop !151

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !153
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !153
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !154
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !155
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !155
  call void @free(i8* %13) #6, !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_good() #0 !dbg !158 {
entry:
  call void @goodG2B(), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !161 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !167, metadata !DIExpression()), !dbg !168
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !169, metadata !DIExpression()), !dbg !170
  %call = call i64 @time(i64* null) #6, !dbg !171
  %conv = trunc i64 %call to i32, !dbg !172
  call void @srand(i32 %conv) #6, !dbg !173
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !174
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_good(), !dbg !175
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !176
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !177
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_bad(), !dbg !178
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !179
  ret i32 0, !dbg !180
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !181 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !182, metadata !DIExpression()), !dbg !183
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !185
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !186
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !187
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !188
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !190
  br i1 %cmp, label %if.then, label %if.end, !dbg !191

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !192
  unreachable, !dbg !192

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !194
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_goodG2BSink(%struct._twoIntsStruct* %2), !dbg !195
  ret void, !dbg !196
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_badSink", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !21, line: 21, type: !4)
!25 = !DILocation(line: 21, column: 89, scope: !20)
!26 = !DILocalVariable(name: "source", scope: !27, file: !21, line: 24, type: !28)
!27 = distinct !DILexicalBlock(scope: !20, file: !21, line: 23, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 24, column: 23, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !21, line: 26, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !21, line: 25, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!36 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!37 = !DILocation(line: 26, column: 20, scope: !33)
!38 = !DILocation(line: 28, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !21, line: 28, column: 13)
!40 = !DILocation(line: 28, column: 18, scope: !39)
!41 = !DILocation(line: 28, column: 25, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !21, line: 28, column: 13)
!43 = !DILocation(line: 28, column: 27, scope: !42)
!44 = !DILocation(line: 28, column: 13, scope: !39)
!45 = !DILocation(line: 30, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !21, line: 29, column: 13)
!47 = !DILocation(line: 30, column: 17, scope: !46)
!48 = !DILocation(line: 30, column: 27, scope: !46)
!49 = !DILocation(line: 30, column: 34, scope: !46)
!50 = !DILocation(line: 31, column: 24, scope: !46)
!51 = !DILocation(line: 31, column: 17, scope: !46)
!52 = !DILocation(line: 31, column: 27, scope: !46)
!53 = !DILocation(line: 31, column: 34, scope: !46)
!54 = !DILocation(line: 32, column: 13, scope: !46)
!55 = !DILocation(line: 28, column: 35, scope: !42)
!56 = !DILocation(line: 28, column: 13, scope: !42)
!57 = distinct !{!57, !44, !58, !59}
!58 = !DILocation(line: 32, column: 13, scope: !39)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocalVariable(name: "i", scope: !61, file: !21, line: 35, type: !34)
!61 = distinct !DILexicalBlock(scope: !27, file: !21, line: 34, column: 9)
!62 = !DILocation(line: 35, column: 20, scope: !61)
!63 = !DILocation(line: 37, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !21, line: 37, column: 13)
!65 = !DILocation(line: 37, column: 18, scope: !64)
!66 = !DILocation(line: 37, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !21, line: 37, column: 13)
!68 = !DILocation(line: 37, column: 27, scope: !67)
!69 = !DILocation(line: 37, column: 13, scope: !64)
!70 = !DILocation(line: 39, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !21, line: 38, column: 13)
!72 = !DILocation(line: 39, column: 22, scope: !71)
!73 = !DILocation(line: 39, column: 34, scope: !71)
!74 = !DILocation(line: 39, column: 27, scope: !71)
!75 = !DILocation(line: 40, column: 13, scope: !71)
!76 = !DILocation(line: 37, column: 35, scope: !67)
!77 = !DILocation(line: 37, column: 13, scope: !67)
!78 = distinct !{!78, !69, !79, !59}
!79 = !DILocation(line: 40, column: 13, scope: !64)
!80 = !DILocation(line: 41, column: 30, scope: !61)
!81 = !DILocation(line: 41, column: 13, scope: !61)
!82 = !DILocation(line: 42, column: 18, scope: !61)
!83 = !DILocation(line: 42, column: 13, scope: !61)
!84 = !DILocation(line: 45, column: 1, scope: !20)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_bad", scope: !21, file: !21, line: 47, type: !86, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{null}
!88 = !DILocalVariable(name: "data", scope: !85, file: !21, line: 49, type: !4)
!89 = !DILocation(line: 49, column: 21, scope: !85)
!90 = !DILocation(line: 50, column: 10, scope: !85)
!91 = !DILocation(line: 52, column: 29, scope: !85)
!92 = !DILocation(line: 52, column: 12, scope: !85)
!93 = !DILocation(line: 52, column: 10, scope: !85)
!94 = !DILocation(line: 53, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !21, line: 53, column: 9)
!96 = !DILocation(line: 53, column: 14, scope: !95)
!97 = !DILocation(line: 53, column: 9, scope: !85)
!98 = !DILocation(line: 53, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !21, line: 53, column: 23)
!100 = !DILocation(line: 54, column: 72, scope: !85)
!101 = !DILocation(line: 54, column: 5, scope: !85)
!102 = !DILocation(line: 55, column: 1, scope: !85)
!103 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_goodG2BSink", scope: !21, file: !21, line: 61, type: !22, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !21, line: 61, type: !4)
!105 = !DILocation(line: 61, column: 93, scope: !103)
!106 = !DILocalVariable(name: "source", scope: !107, file: !21, line: 64, type: !28)
!107 = distinct !DILexicalBlock(scope: !103, file: !21, line: 63, column: 5)
!108 = !DILocation(line: 64, column: 23, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !110, file: !21, line: 66, type: !34)
!110 = distinct !DILexicalBlock(scope: !107, file: !21, line: 65, column: 9)
!111 = !DILocation(line: 66, column: 20, scope: !110)
!112 = !DILocation(line: 68, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !21, line: 68, column: 13)
!114 = !DILocation(line: 68, column: 18, scope: !113)
!115 = !DILocation(line: 68, column: 25, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !21, line: 68, column: 13)
!117 = !DILocation(line: 68, column: 27, scope: !116)
!118 = !DILocation(line: 68, column: 13, scope: !113)
!119 = !DILocation(line: 70, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !21, line: 69, column: 13)
!121 = !DILocation(line: 70, column: 17, scope: !120)
!122 = !DILocation(line: 70, column: 27, scope: !120)
!123 = !DILocation(line: 70, column: 34, scope: !120)
!124 = !DILocation(line: 71, column: 24, scope: !120)
!125 = !DILocation(line: 71, column: 17, scope: !120)
!126 = !DILocation(line: 71, column: 27, scope: !120)
!127 = !DILocation(line: 71, column: 34, scope: !120)
!128 = !DILocation(line: 72, column: 13, scope: !120)
!129 = !DILocation(line: 68, column: 35, scope: !116)
!130 = !DILocation(line: 68, column: 13, scope: !116)
!131 = distinct !{!131, !118, !132, !59}
!132 = !DILocation(line: 72, column: 13, scope: !113)
!133 = !DILocalVariable(name: "i", scope: !134, file: !21, line: 75, type: !34)
!134 = distinct !DILexicalBlock(scope: !107, file: !21, line: 74, column: 9)
!135 = !DILocation(line: 75, column: 20, scope: !134)
!136 = !DILocation(line: 77, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !21, line: 77, column: 13)
!138 = !DILocation(line: 77, column: 18, scope: !137)
!139 = !DILocation(line: 77, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !21, line: 77, column: 13)
!141 = !DILocation(line: 77, column: 27, scope: !140)
!142 = !DILocation(line: 77, column: 13, scope: !137)
!143 = !DILocation(line: 79, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !21, line: 78, column: 13)
!145 = !DILocation(line: 79, column: 22, scope: !144)
!146 = !DILocation(line: 79, column: 34, scope: !144)
!147 = !DILocation(line: 79, column: 27, scope: !144)
!148 = !DILocation(line: 80, column: 13, scope: !144)
!149 = !DILocation(line: 77, column: 35, scope: !140)
!150 = !DILocation(line: 77, column: 13, scope: !140)
!151 = distinct !{!151, !142, !152, !59}
!152 = !DILocation(line: 80, column: 13, scope: !137)
!153 = !DILocation(line: 81, column: 30, scope: !134)
!154 = !DILocation(line: 81, column: 13, scope: !134)
!155 = !DILocation(line: 82, column: 18, scope: !134)
!156 = !DILocation(line: 82, column: 13, scope: !134)
!157 = !DILocation(line: 85, column: 1, scope: !103)
!158 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_41_good", scope: !21, file: !21, line: 98, type: !86, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!159 = !DILocation(line: 100, column: 5, scope: !158)
!160 = !DILocation(line: 101, column: 1, scope: !158)
!161 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 113, type: !162, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!162 = !DISubroutineType(types: !163)
!163 = !{!10, !10, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!167 = !DILocalVariable(name: "argc", arg: 1, scope: !161, file: !21, line: 113, type: !10)
!168 = !DILocation(line: 113, column: 14, scope: !161)
!169 = !DILocalVariable(name: "argv", arg: 2, scope: !161, file: !21, line: 113, type: !164)
!170 = !DILocation(line: 113, column: 27, scope: !161)
!171 = !DILocation(line: 116, column: 22, scope: !161)
!172 = !DILocation(line: 116, column: 12, scope: !161)
!173 = !DILocation(line: 116, column: 5, scope: !161)
!174 = !DILocation(line: 118, column: 5, scope: !161)
!175 = !DILocation(line: 119, column: 5, scope: !161)
!176 = !DILocation(line: 120, column: 5, scope: !161)
!177 = !DILocation(line: 123, column: 5, scope: !161)
!178 = !DILocation(line: 124, column: 5, scope: !161)
!179 = !DILocation(line: 125, column: 5, scope: !161)
!180 = !DILocation(line: 127, column: 5, scope: !161)
!181 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 88, type: !86, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!182 = !DILocalVariable(name: "data", scope: !181, file: !21, line: 90, type: !4)
!183 = !DILocation(line: 90, column: 21, scope: !181)
!184 = !DILocation(line: 91, column: 10, scope: !181)
!185 = !DILocation(line: 93, column: 29, scope: !181)
!186 = !DILocation(line: 93, column: 12, scope: !181)
!187 = !DILocation(line: 93, column: 10, scope: !181)
!188 = !DILocation(line: 94, column: 9, scope: !189)
!189 = distinct !DILexicalBlock(scope: !181, file: !21, line: 94, column: 9)
!190 = !DILocation(line: 94, column: 14, scope: !189)
!191 = !DILocation(line: 94, column: 9, scope: !181)
!192 = !DILocation(line: 94, column: 24, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !21, line: 94, column: 23)
!194 = !DILocation(line: 95, column: 76, scope: !181)
!195 = !DILocation(line: 95, column: 5, scope: !181)
!196 = !DILocation(line: 96, column: 1, scope: !181)
