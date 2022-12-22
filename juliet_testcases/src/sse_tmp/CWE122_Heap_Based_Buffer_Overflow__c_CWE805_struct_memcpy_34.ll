; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !34
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !44
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !49
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !49
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !65
  %cmp2 = icmp ult i64 %4, 100, !dbg !67
  br i1 %cmp2, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !71
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !72
  store i32 0, i32* %intOne, align 8, !dbg !73
  %6 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !75
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !76
  store i32 0, i32* %intTwo, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %7, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !84
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !85
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !85
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !85
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !86
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !86
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !87
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !88
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !88
  call void @free(i8* %13) #6, !dbg !89
  ret void, !dbg !90
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #6, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #6, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType* %myUnion, metadata !117, metadata !DIExpression()), !dbg !118
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !120
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !121
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !123
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !129
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !130
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !132, metadata !DIExpression()), !dbg !134
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !135
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !135
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !145
  %cmp2 = icmp ult i64 %4, 100, !dbg !147
  br i1 %cmp2, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !151
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !152
  store i32 0, i32* %intOne, align 8, !dbg !153
  %6 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !155
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !156
  store i32 0, i32* %intTwo, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %7, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !163
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !164
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !164
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !164
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !164
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !165
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !165
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !166
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !167
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !167
  call void @free(i8* %13) #6, !dbg !168
  ret void, !dbg !169
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12, !13}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_bad", scope: !21, file: !21, line: 27, type: !22, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 29, type: !4)
!25 = !DILocation(line: 29, column: 21, scope: !20)
!26 = !DILocalVariable(name: "myUnion", scope: !20, file: !21, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_unionType", file: !21, line: 23, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !21, line: 19, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !21, line: 21, baseType: !4, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !21, line: 22, baseType: !4, size: 64)
!32 = !DILocation(line: 30, column: 76, scope: !20)
!33 = !DILocation(line: 31, column: 10, scope: !20)
!34 = !DILocation(line: 33, column: 29, scope: !20)
!35 = !DILocation(line: 33, column: 12, scope: !20)
!36 = !DILocation(line: 33, column: 10, scope: !20)
!37 = !DILocation(line: 34, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !20, file: !21, line: 34, column: 9)
!39 = !DILocation(line: 34, column: 14, scope: !38)
!40 = !DILocation(line: 34, column: 9, scope: !20)
!41 = !DILocation(line: 34, column: 24, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !21, line: 34, column: 23)
!43 = !DILocation(line: 35, column: 26, scope: !20)
!44 = !DILocation(line: 35, column: 13, scope: !20)
!45 = !DILocation(line: 35, column: 24, scope: !20)
!46 = !DILocalVariable(name: "data", scope: !47, file: !21, line: 37, type: !4)
!47 = distinct !DILexicalBlock(scope: !20, file: !21, line: 36, column: 5)
!48 = !DILocation(line: 37, column: 25, scope: !47)
!49 = !DILocation(line: 37, column: 40, scope: !47)
!50 = !DILocalVariable(name: "source", scope: !51, file: !21, line: 39, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !21, line: 38, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 39, column: 27, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !57, file: !21, line: 41, type: !58)
!57 = distinct !DILexicalBlock(scope: !51, file: !21, line: 40, column: 13)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 46, baseType: !60)
!59 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 41, column: 24, scope: !57)
!62 = !DILocation(line: 43, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !21, line: 43, column: 17)
!64 = !DILocation(line: 43, column: 22, scope: !63)
!65 = !DILocation(line: 43, column: 29, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !21, line: 43, column: 17)
!67 = !DILocation(line: 43, column: 31, scope: !66)
!68 = !DILocation(line: 43, column: 17, scope: !63)
!69 = !DILocation(line: 45, column: 28, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !21, line: 44, column: 17)
!71 = !DILocation(line: 45, column: 21, scope: !70)
!72 = !DILocation(line: 45, column: 31, scope: !70)
!73 = !DILocation(line: 45, column: 38, scope: !70)
!74 = !DILocation(line: 46, column: 28, scope: !70)
!75 = !DILocation(line: 46, column: 21, scope: !70)
!76 = !DILocation(line: 46, column: 31, scope: !70)
!77 = !DILocation(line: 46, column: 38, scope: !70)
!78 = !DILocation(line: 47, column: 17, scope: !70)
!79 = !DILocation(line: 43, column: 39, scope: !66)
!80 = !DILocation(line: 43, column: 17, scope: !66)
!81 = distinct !{!81, !68, !82, !83}
!82 = !DILocation(line: 47, column: 17, scope: !63)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 50, column: 20, scope: !51)
!85 = !DILocation(line: 50, column: 13, scope: !51)
!86 = !DILocation(line: 51, column: 30, scope: !51)
!87 = !DILocation(line: 51, column: 13, scope: !51)
!88 = !DILocation(line: 52, column: 18, scope: !51)
!89 = !DILocation(line: 52, column: 13, scope: !51)
!90 = !DILocation(line: 55, column: 1, scope: !20)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_34_good", scope: !21, file: !21, line: 92, type: !22, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 94, column: 5, scope: !91)
!93 = !DILocation(line: 95, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 106, type: !95, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!10, !10, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !21, line: 106, type: !10)
!101 = !DILocation(line: 106, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !21, line: 106, type: !97)
!103 = !DILocation(line: 106, column: 27, scope: !94)
!104 = !DILocation(line: 109, column: 22, scope: !94)
!105 = !DILocation(line: 109, column: 12, scope: !94)
!106 = !DILocation(line: 109, column: 5, scope: !94)
!107 = !DILocation(line: 111, column: 5, scope: !94)
!108 = !DILocation(line: 112, column: 5, scope: !94)
!109 = !DILocation(line: 113, column: 5, scope: !94)
!110 = !DILocation(line: 116, column: 5, scope: !94)
!111 = !DILocation(line: 117, column: 5, scope: !94)
!112 = !DILocation(line: 118, column: 5, scope: !94)
!113 = !DILocation(line: 120, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !21, line: 64, type: !4)
!116 = !DILocation(line: 64, column: 21, scope: !114)
!117 = !DILocalVariable(name: "myUnion", scope: !114, file: !21, line: 65, type: !27)
!118 = !DILocation(line: 65, column: 76, scope: !114)
!119 = !DILocation(line: 66, column: 10, scope: !114)
!120 = !DILocation(line: 68, column: 29, scope: !114)
!121 = !DILocation(line: 68, column: 12, scope: !114)
!122 = !DILocation(line: 68, column: 10, scope: !114)
!123 = !DILocation(line: 69, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !21, line: 69, column: 9)
!125 = !DILocation(line: 69, column: 14, scope: !124)
!126 = !DILocation(line: 69, column: 9, scope: !114)
!127 = !DILocation(line: 69, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !21, line: 69, column: 23)
!129 = !DILocation(line: 70, column: 26, scope: !114)
!130 = !DILocation(line: 70, column: 13, scope: !114)
!131 = !DILocation(line: 70, column: 24, scope: !114)
!132 = !DILocalVariable(name: "data", scope: !133, file: !21, line: 72, type: !4)
!133 = distinct !DILexicalBlock(scope: !114, file: !21, line: 71, column: 5)
!134 = !DILocation(line: 72, column: 25, scope: !133)
!135 = !DILocation(line: 72, column: 40, scope: !133)
!136 = !DILocalVariable(name: "source", scope: !137, file: !21, line: 74, type: !52)
!137 = distinct !DILexicalBlock(scope: !133, file: !21, line: 73, column: 9)
!138 = !DILocation(line: 74, column: 27, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !21, line: 76, type: !58)
!140 = distinct !DILexicalBlock(scope: !137, file: !21, line: 75, column: 13)
!141 = !DILocation(line: 76, column: 24, scope: !140)
!142 = !DILocation(line: 78, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !21, line: 78, column: 17)
!144 = !DILocation(line: 78, column: 22, scope: !143)
!145 = !DILocation(line: 78, column: 29, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !21, line: 78, column: 17)
!147 = !DILocation(line: 78, column: 31, scope: !146)
!148 = !DILocation(line: 78, column: 17, scope: !143)
!149 = !DILocation(line: 80, column: 28, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !21, line: 79, column: 17)
!151 = !DILocation(line: 80, column: 21, scope: !150)
!152 = !DILocation(line: 80, column: 31, scope: !150)
!153 = !DILocation(line: 80, column: 38, scope: !150)
!154 = !DILocation(line: 81, column: 28, scope: !150)
!155 = !DILocation(line: 81, column: 21, scope: !150)
!156 = !DILocation(line: 81, column: 31, scope: !150)
!157 = !DILocation(line: 81, column: 38, scope: !150)
!158 = !DILocation(line: 82, column: 17, scope: !150)
!159 = !DILocation(line: 78, column: 39, scope: !146)
!160 = !DILocation(line: 78, column: 17, scope: !146)
!161 = distinct !{!161, !148, !162, !83}
!162 = !DILocation(line: 82, column: 17, scope: !143)
!163 = !DILocation(line: 85, column: 20, scope: !137)
!164 = !DILocation(line: 85, column: 13, scope: !137)
!165 = !DILocation(line: 86, column: 30, scope: !137)
!166 = !DILocation(line: 86, column: 13, scope: !137)
!167 = !DILocation(line: 87, column: 18, scope: !137)
!168 = !DILocation(line: 87, column: 13, scope: !137)
!169 = !DILocation(line: 90, column: 1, scope: !114)
