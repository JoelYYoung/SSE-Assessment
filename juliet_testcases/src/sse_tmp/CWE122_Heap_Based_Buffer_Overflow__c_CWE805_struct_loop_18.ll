; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source1 = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  br label %source, !dbg !27

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !28), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source1, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !54
  %cmp2 = icmp ult i64 %2, 100, !dbg !56
  br i1 %cmp2, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %3, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %4, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %5, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !73, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i4, align 8, !dbg !76
  br label %for.cond5, !dbg !78

for.cond5:                                        ; preds = %for.inc10, %for.end
  %6 = load i64, i64* %i4, align 8, !dbg !79
  %cmp6 = icmp ult i64 %6, 100, !dbg !81
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !82

for.body7:                                        ; preds = %for.cond5
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %8 = load i64, i64* %i4, align 8, !dbg !85
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !83
  %9 = load i64, i64* %i4, align 8, !dbg !86
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %9, !dbg !87
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !87
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !87
  br label %for.inc10, !dbg !88

for.inc10:                                        ; preds = %for.body7
  %12 = load i64, i64* %i4, align 8, !dbg !89
  %inc11 = add i64 %12, 1, !dbg !89
  store i64 %inc11, i64* %i4, align 8, !dbg !89
  br label %for.cond5, !dbg !90, !llvm.loop !91

for.end12:                                        ; preds = %for.cond5
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !93
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !94
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !95
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !95
  call void @free(i8* %15) #6, !dbg !96
  ret void, !dbg !97
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18_good() #0 !dbg !98 {
entry:
  call void @goodG2B(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #6, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #6, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !121 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source1 = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !122, metadata !DIExpression()), !dbg !123
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !124
  br label %source, !dbg !125

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !126), !dbg !127
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !128
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !129
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !130
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source1, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !146
  %cmp2 = icmp ult i64 %2, 100, !dbg !148
  br i1 %cmp2, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %3, !dbg !152
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !153
  store i32 0, i32* %intOne, align 8, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %4, !dbg !156
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !157
  store i32 0, i32* %intTwo, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %5, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !164, metadata !DIExpression()), !dbg !166
  store i64 0, i64* %i4, align 8, !dbg !167
  br label %for.cond5, !dbg !169

for.cond5:                                        ; preds = %for.inc10, %for.end
  %6 = load i64, i64* %i4, align 8, !dbg !170
  %cmp6 = icmp ult i64 %6, 100, !dbg !172
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !173

for.body7:                                        ; preds = %for.cond5
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !174
  %8 = load i64, i64* %i4, align 8, !dbg !176
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !174
  %9 = load i64, i64* %i4, align 8, !dbg !177
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source1, i64 0, i64 %9, !dbg !178
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !178
  %11 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !178
  br label %for.inc10, !dbg !179

for.inc10:                                        ; preds = %for.body7
  %12 = load i64, i64* %i4, align 8, !dbg !180
  %inc11 = add i64 %12, 1, !dbg !180
  store i64 %inc11, i64* %i4, align 8, !dbg !180
  br label %for.cond5, !dbg !181, !llvm.loop !182

for.end12:                                        ; preds = %for.cond5
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !184
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx13), !dbg !185
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !186
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !186
  call void @free(i8* %15) #6, !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 25, column: 5, scope: !20)
!28 = !DILabel(scope: !20, name: "source", file: !21, line: 26)
!29 = !DILocation(line: 26, column: 1, scope: !20)
!30 = !DILocation(line: 28, column: 29, scope: !20)
!31 = !DILocation(line: 28, column: 12, scope: !20)
!32 = !DILocation(line: 28, column: 10, scope: !20)
!33 = !DILocation(line: 29, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !21, line: 29, column: 9)
!35 = !DILocation(line: 29, column: 14, scope: !34)
!36 = !DILocation(line: 29, column: 9, scope: !20)
!37 = !DILocation(line: 29, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !21, line: 29, column: 23)
!39 = !DILocalVariable(name: "source", scope: !40, file: !21, line: 31, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !21, line: 30, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 31, column: 23, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !21, line: 33, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !21, line: 32, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 33, column: 20, scope: !46)
!51 = !DILocation(line: 35, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !21, line: 35, column: 13)
!53 = !DILocation(line: 35, column: 18, scope: !52)
!54 = !DILocation(line: 35, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !21, line: 35, column: 13)
!56 = !DILocation(line: 35, column: 27, scope: !55)
!57 = !DILocation(line: 35, column: 13, scope: !52)
!58 = !DILocation(line: 37, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !21, line: 36, column: 13)
!60 = !DILocation(line: 37, column: 17, scope: !59)
!61 = !DILocation(line: 37, column: 27, scope: !59)
!62 = !DILocation(line: 37, column: 34, scope: !59)
!63 = !DILocation(line: 38, column: 24, scope: !59)
!64 = !DILocation(line: 38, column: 17, scope: !59)
!65 = !DILocation(line: 38, column: 27, scope: !59)
!66 = !DILocation(line: 38, column: 34, scope: !59)
!67 = !DILocation(line: 39, column: 13, scope: !59)
!68 = !DILocation(line: 35, column: 35, scope: !55)
!69 = !DILocation(line: 35, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 39, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocalVariable(name: "i", scope: !74, file: !21, line: 42, type: !47)
!74 = distinct !DILexicalBlock(scope: !40, file: !21, line: 41, column: 9)
!75 = !DILocation(line: 42, column: 20, scope: !74)
!76 = !DILocation(line: 44, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !21, line: 44, column: 13)
!78 = !DILocation(line: 44, column: 18, scope: !77)
!79 = !DILocation(line: 44, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !21, line: 44, column: 13)
!81 = !DILocation(line: 44, column: 27, scope: !80)
!82 = !DILocation(line: 44, column: 13, scope: !77)
!83 = !DILocation(line: 46, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !21, line: 45, column: 13)
!85 = !DILocation(line: 46, column: 22, scope: !84)
!86 = !DILocation(line: 46, column: 34, scope: !84)
!87 = !DILocation(line: 46, column: 27, scope: !84)
!88 = !DILocation(line: 47, column: 13, scope: !84)
!89 = !DILocation(line: 44, column: 35, scope: !80)
!90 = !DILocation(line: 44, column: 13, scope: !80)
!91 = distinct !{!91, !82, !92, !72}
!92 = !DILocation(line: 47, column: 13, scope: !77)
!93 = !DILocation(line: 48, column: 30, scope: !74)
!94 = !DILocation(line: 48, column: 13, scope: !74)
!95 = !DILocation(line: 49, column: 18, scope: !74)
!96 = !DILocation(line: 49, column: 13, scope: !74)
!97 = !DILocation(line: 52, column: 1, scope: !20)
!98 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_18_good", scope: !21, file: !21, line: 92, type: !22, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocation(line: 94, column: 5, scope: !98)
!100 = !DILocation(line: 95, column: 1, scope: !98)
!101 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 107, type: !102, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!10, !10, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !21, line: 107, type: !10)
!108 = !DILocation(line: 107, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !21, line: 107, type: !104)
!110 = !DILocation(line: 107, column: 27, scope: !101)
!111 = !DILocation(line: 110, column: 22, scope: !101)
!112 = !DILocation(line: 110, column: 12, scope: !101)
!113 = !DILocation(line: 110, column: 5, scope: !101)
!114 = !DILocation(line: 112, column: 5, scope: !101)
!115 = !DILocation(line: 113, column: 5, scope: !101)
!116 = !DILocation(line: 114, column: 5, scope: !101)
!117 = !DILocation(line: 117, column: 5, scope: !101)
!118 = !DILocation(line: 118, column: 5, scope: !101)
!119 = !DILocation(line: 119, column: 5, scope: !101)
!120 = !DILocation(line: 121, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 59, type: !22, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !21, line: 61, type: !4)
!123 = !DILocation(line: 61, column: 21, scope: !121)
!124 = !DILocation(line: 62, column: 10, scope: !121)
!125 = !DILocation(line: 63, column: 5, scope: !121)
!126 = !DILabel(scope: !121, name: "source", file: !21, line: 64)
!127 = !DILocation(line: 64, column: 1, scope: !121)
!128 = !DILocation(line: 66, column: 29, scope: !121)
!129 = !DILocation(line: 66, column: 12, scope: !121)
!130 = !DILocation(line: 66, column: 10, scope: !121)
!131 = !DILocation(line: 67, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !121, file: !21, line: 67, column: 9)
!133 = !DILocation(line: 67, column: 14, scope: !132)
!134 = !DILocation(line: 67, column: 9, scope: !121)
!135 = !DILocation(line: 67, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !21, line: 67, column: 23)
!137 = !DILocalVariable(name: "source", scope: !138, file: !21, line: 69, type: !41)
!138 = distinct !DILexicalBlock(scope: !121, file: !21, line: 68, column: 5)
!139 = !DILocation(line: 69, column: 23, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !21, line: 71, type: !47)
!141 = distinct !DILexicalBlock(scope: !138, file: !21, line: 70, column: 9)
!142 = !DILocation(line: 71, column: 20, scope: !141)
!143 = !DILocation(line: 73, column: 20, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !21, line: 73, column: 13)
!145 = !DILocation(line: 73, column: 18, scope: !144)
!146 = !DILocation(line: 73, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !21, line: 73, column: 13)
!148 = !DILocation(line: 73, column: 27, scope: !147)
!149 = !DILocation(line: 73, column: 13, scope: !144)
!150 = !DILocation(line: 75, column: 24, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !21, line: 74, column: 13)
!152 = !DILocation(line: 75, column: 17, scope: !151)
!153 = !DILocation(line: 75, column: 27, scope: !151)
!154 = !DILocation(line: 75, column: 34, scope: !151)
!155 = !DILocation(line: 76, column: 24, scope: !151)
!156 = !DILocation(line: 76, column: 17, scope: !151)
!157 = !DILocation(line: 76, column: 27, scope: !151)
!158 = !DILocation(line: 76, column: 34, scope: !151)
!159 = !DILocation(line: 77, column: 13, scope: !151)
!160 = !DILocation(line: 73, column: 35, scope: !147)
!161 = !DILocation(line: 73, column: 13, scope: !147)
!162 = distinct !{!162, !149, !163, !72}
!163 = !DILocation(line: 77, column: 13, scope: !144)
!164 = !DILocalVariable(name: "i", scope: !165, file: !21, line: 80, type: !47)
!165 = distinct !DILexicalBlock(scope: !138, file: !21, line: 79, column: 9)
!166 = !DILocation(line: 80, column: 20, scope: !165)
!167 = !DILocation(line: 82, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !21, line: 82, column: 13)
!169 = !DILocation(line: 82, column: 18, scope: !168)
!170 = !DILocation(line: 82, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !21, line: 82, column: 13)
!172 = !DILocation(line: 82, column: 27, scope: !171)
!173 = !DILocation(line: 82, column: 13, scope: !168)
!174 = !DILocation(line: 84, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !21, line: 83, column: 13)
!176 = !DILocation(line: 84, column: 22, scope: !175)
!177 = !DILocation(line: 84, column: 34, scope: !175)
!178 = !DILocation(line: 84, column: 27, scope: !175)
!179 = !DILocation(line: 85, column: 13, scope: !175)
!180 = !DILocation(line: 82, column: 35, scope: !171)
!181 = !DILocation(line: 82, column: 13, scope: !171)
!182 = distinct !{!182, !173, !183, !72}
!183 = !DILocation(line: 85, column: 13, scope: !168)
!184 = !DILocation(line: 86, column: 30, scope: !165)
!185 = !DILocation(line: 86, column: 13, scope: !165)
!186 = !DILocation(line: 87, column: 18, scope: !165)
!187 = !DILocation(line: 87, column: 13, scope: !165)
!188 = !DILocation(line: 90, column: 1, scope: !121)
