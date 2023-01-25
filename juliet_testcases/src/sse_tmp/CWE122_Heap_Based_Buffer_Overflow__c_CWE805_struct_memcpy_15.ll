; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !27
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !51
  %cmp1 = icmp ult i64 %2, 100, !dbg !53
  br i1 %cmp1, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !57
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !58
  store i32 0, i32* %intOne, align 8, !dbg !59
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !61
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !62
  store i32 0, i32* %intTwo, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %5, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !70
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !71
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !71
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !71
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !72
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !73
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !74
  call void @free(i8* %11) #6, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #6, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #6, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !105
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !106
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !123
  %cmp1 = icmp ult i64 %2, 100, !dbg !125
  br i1 %cmp1, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !129
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !130
  store i32 0, i32* %intOne, align 8, !dbg !131
  %4 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !133
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !134
  store i32 0, i32* %intTwo, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %5, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !142
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !142
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !142
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !142
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !143
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !144
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !145
  call void @free(i8* %11) #6, !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !149, metadata !DIExpression()), !dbg !150
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !151
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !152
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !153
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !154
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !157
  br i1 %cmp, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !159
  unreachable, !dbg !159

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !170
  %cmp1 = icmp ult i64 %2, 100, !dbg !172
  br i1 %cmp1, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !176
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !177
  store i32 0, i32* %intOne, align 8, !dbg !178
  %4 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !180
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !181
  store i32 0, i32* %intTwo, align 4, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %5, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !188
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !189
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !189
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !189
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !189
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !190
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !191
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !192
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !192
  call void @free(i8* %11) #6, !dbg !193
  ret void, !dbg !194
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !4)
!25 = !DILocation(line: 23, column: 21, scope: !20)
!26 = !DILocation(line: 24, column: 10, scope: !20)
!27 = !DILocation(line: 29, column: 33, scope: !20)
!28 = !DILocation(line: 29, column: 16, scope: !20)
!29 = !DILocation(line: 29, column: 14, scope: !20)
!30 = !DILocation(line: 30, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !21, line: 30, column: 13)
!32 = !DILocation(line: 30, column: 18, scope: !31)
!33 = !DILocation(line: 30, column: 13, scope: !20)
!34 = !DILocation(line: 30, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !21, line: 30, column: 27)
!36 = !DILocalVariable(name: "source", scope: !37, file: !21, line: 38, type: !38)
!37 = distinct !DILexicalBlock(scope: !20, file: !21, line: 37, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 38, column: 23, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !21, line: 40, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !21, line: 39, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 40, column: 20, scope: !43)
!48 = !DILocation(line: 42, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !21, line: 42, column: 13)
!50 = !DILocation(line: 42, column: 18, scope: !49)
!51 = !DILocation(line: 42, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !21, line: 42, column: 13)
!53 = !DILocation(line: 42, column: 27, scope: !52)
!54 = !DILocation(line: 42, column: 13, scope: !49)
!55 = !DILocation(line: 44, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !21, line: 43, column: 13)
!57 = !DILocation(line: 44, column: 17, scope: !56)
!58 = !DILocation(line: 44, column: 27, scope: !56)
!59 = !DILocation(line: 44, column: 34, scope: !56)
!60 = !DILocation(line: 45, column: 24, scope: !56)
!61 = !DILocation(line: 45, column: 17, scope: !56)
!62 = !DILocation(line: 45, column: 27, scope: !56)
!63 = !DILocation(line: 45, column: 34, scope: !56)
!64 = !DILocation(line: 46, column: 13, scope: !56)
!65 = !DILocation(line: 42, column: 35, scope: !52)
!66 = !DILocation(line: 42, column: 13, scope: !52)
!67 = distinct !{!67, !54, !68, !69}
!68 = !DILocation(line: 46, column: 13, scope: !49)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 49, column: 16, scope: !37)
!71 = !DILocation(line: 49, column: 9, scope: !37)
!72 = !DILocation(line: 50, column: 26, scope: !37)
!73 = !DILocation(line: 50, column: 9, scope: !37)
!74 = !DILocation(line: 51, column: 14, scope: !37)
!75 = !DILocation(line: 51, column: 9, scope: !37)
!76 = !DILocation(line: 53, column: 1, scope: !20)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_15_good", scope: !21, file: !21, line: 129, type: !22, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 131, column: 5, scope: !77)
!79 = !DILocation(line: 132, column: 5, scope: !77)
!80 = !DILocation(line: 133, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 145, type: !82, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!10, !10, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !21, line: 145, type: !10)
!88 = !DILocation(line: 145, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !21, line: 145, type: !84)
!90 = !DILocation(line: 145, column: 27, scope: !81)
!91 = !DILocation(line: 148, column: 22, scope: !81)
!92 = !DILocation(line: 148, column: 12, scope: !81)
!93 = !DILocation(line: 148, column: 5, scope: !81)
!94 = !DILocation(line: 150, column: 5, scope: !81)
!95 = !DILocation(line: 151, column: 5, scope: !81)
!96 = !DILocation(line: 152, column: 5, scope: !81)
!97 = !DILocation(line: 155, column: 5, scope: !81)
!98 = !DILocation(line: 156, column: 5, scope: !81)
!99 = !DILocation(line: 157, column: 5, scope: !81)
!100 = !DILocation(line: 159, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !21, line: 62, type: !4)
!103 = !DILocation(line: 62, column: 21, scope: !101)
!104 = !DILocation(line: 63, column: 10, scope: !101)
!105 = !DILocation(line: 72, column: 33, scope: !101)
!106 = !DILocation(line: 72, column: 16, scope: !101)
!107 = !DILocation(line: 72, column: 14, scope: !101)
!108 = !DILocation(line: 73, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !21, line: 73, column: 13)
!110 = !DILocation(line: 73, column: 18, scope: !109)
!111 = !DILocation(line: 73, column: 13, scope: !101)
!112 = !DILocation(line: 73, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !21, line: 73, column: 27)
!114 = !DILocalVariable(name: "source", scope: !115, file: !21, line: 77, type: !38)
!115 = distinct !DILexicalBlock(scope: !101, file: !21, line: 76, column: 5)
!116 = !DILocation(line: 77, column: 23, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !21, line: 79, type: !44)
!118 = distinct !DILexicalBlock(scope: !115, file: !21, line: 78, column: 9)
!119 = !DILocation(line: 79, column: 20, scope: !118)
!120 = !DILocation(line: 81, column: 20, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !21, line: 81, column: 13)
!122 = !DILocation(line: 81, column: 18, scope: !121)
!123 = !DILocation(line: 81, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !21, line: 81, column: 13)
!125 = !DILocation(line: 81, column: 27, scope: !124)
!126 = !DILocation(line: 81, column: 13, scope: !121)
!127 = !DILocation(line: 83, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !21, line: 82, column: 13)
!129 = !DILocation(line: 83, column: 17, scope: !128)
!130 = !DILocation(line: 83, column: 27, scope: !128)
!131 = !DILocation(line: 83, column: 34, scope: !128)
!132 = !DILocation(line: 84, column: 24, scope: !128)
!133 = !DILocation(line: 84, column: 17, scope: !128)
!134 = !DILocation(line: 84, column: 27, scope: !128)
!135 = !DILocation(line: 84, column: 34, scope: !128)
!136 = !DILocation(line: 85, column: 13, scope: !128)
!137 = !DILocation(line: 81, column: 35, scope: !124)
!138 = !DILocation(line: 81, column: 13, scope: !124)
!139 = distinct !{!139, !126, !140, !69}
!140 = !DILocation(line: 85, column: 13, scope: !121)
!141 = !DILocation(line: 88, column: 16, scope: !115)
!142 = !DILocation(line: 88, column: 9, scope: !115)
!143 = !DILocation(line: 89, column: 26, scope: !115)
!144 = !DILocation(line: 89, column: 9, scope: !115)
!145 = !DILocation(line: 90, column: 14, scope: !115)
!146 = !DILocation(line: 90, column: 9, scope: !115)
!147 = !DILocation(line: 92, column: 1, scope: !101)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 95, type: !22, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !21, line: 97, type: !4)
!150 = !DILocation(line: 97, column: 21, scope: !148)
!151 = !DILocation(line: 98, column: 10, scope: !148)
!152 = !DILocation(line: 103, column: 33, scope: !148)
!153 = !DILocation(line: 103, column: 16, scope: !148)
!154 = !DILocation(line: 103, column: 14, scope: !148)
!155 = !DILocation(line: 104, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !148, file: !21, line: 104, column: 13)
!157 = !DILocation(line: 104, column: 18, scope: !156)
!158 = !DILocation(line: 104, column: 13, scope: !148)
!159 = !DILocation(line: 104, column: 28, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !21, line: 104, column: 27)
!161 = !DILocalVariable(name: "source", scope: !162, file: !21, line: 112, type: !38)
!162 = distinct !DILexicalBlock(scope: !148, file: !21, line: 111, column: 5)
!163 = !DILocation(line: 112, column: 23, scope: !162)
!164 = !DILocalVariable(name: "i", scope: !165, file: !21, line: 114, type: !44)
!165 = distinct !DILexicalBlock(scope: !162, file: !21, line: 113, column: 9)
!166 = !DILocation(line: 114, column: 20, scope: !165)
!167 = !DILocation(line: 116, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !21, line: 116, column: 13)
!169 = !DILocation(line: 116, column: 18, scope: !168)
!170 = !DILocation(line: 116, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !21, line: 116, column: 13)
!172 = !DILocation(line: 116, column: 27, scope: !171)
!173 = !DILocation(line: 116, column: 13, scope: !168)
!174 = !DILocation(line: 118, column: 24, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !21, line: 117, column: 13)
!176 = !DILocation(line: 118, column: 17, scope: !175)
!177 = !DILocation(line: 118, column: 27, scope: !175)
!178 = !DILocation(line: 118, column: 34, scope: !175)
!179 = !DILocation(line: 119, column: 24, scope: !175)
!180 = !DILocation(line: 119, column: 17, scope: !175)
!181 = !DILocation(line: 119, column: 27, scope: !175)
!182 = !DILocation(line: 119, column: 34, scope: !175)
!183 = !DILocation(line: 120, column: 13, scope: !175)
!184 = !DILocation(line: 116, column: 35, scope: !171)
!185 = !DILocation(line: 116, column: 13, scope: !171)
!186 = distinct !{!186, !173, !187, !69}
!187 = !DILocation(line: 120, column: 13, scope: !168)
!188 = !DILocation(line: 123, column: 16, scope: !162)
!189 = !DILocation(line: 123, column: 9, scope: !162)
!190 = !DILocation(line: 124, column: 26, scope: !162)
!191 = !DILocation(line: 124, column: 9, scope: !162)
!192 = !DILocation(line: 125, column: 14, scope: !162)
!193 = !DILocation(line: 125, column: 9, scope: !162)
!194 = !DILocation(line: 127, column: 1, scope: !148)
