; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17_bad() #0 !dbg !20 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !28
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !36
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !42
  br i1 %cmp1, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %3, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !58, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i2, align 8, !dbg !64
  br label %for.cond3, !dbg !66

for.cond3:                                        ; preds = %for.inc7, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !67
  %cmp4 = icmp ult i64 %4, 100, !dbg !69
  br i1 %cmp4, label %for.body5, label %for.end9, !dbg !70

for.body5:                                        ; preds = %for.cond3
  %5 = load i64, i64* %i2, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !73
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !74
  store i32 0, i32* %intOne, align 8, !dbg !75
  %6 = load i64, i64* %i2, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !77
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx6, i32 0, i32 1, !dbg !78
  store i32 0, i32* %intTwo, align 4, !dbg !79
  br label %for.inc7, !dbg !80

for.inc7:                                         ; preds = %for.body5
  %7 = load i64, i64* %i2, align 8, !dbg !81
  %inc8 = add i64 %7, 1, !dbg !81
  store i64 %inc8, i64* %i2, align 8, !dbg !81
  br label %for.cond3, !dbg !82, !llvm.loop !83

for.end9:                                         ; preds = %for.cond3
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !85
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !86
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !86
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !87
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx10), !dbg !88
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !89
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !89
  call void @free(i8* %13) #6, !dbg !90
  ret void, !dbg !91
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #6, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #6, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !120
  store i32 0, i32* %h, align 4, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !124
  %cmp = icmp slt i32 %0, 1, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !128
  %1 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !130
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data, align 8, !dbg !131
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %cmp1 = icmp eq %struct._twoIntsStruct* %2, null, !dbg !134
  br i1 %cmp1, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !139
  %inc = add nsw i32 %3, 1, !dbg !139
  store i32 %inc, i32* %h, align 4, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %i, metadata !146, metadata !DIExpression()), !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond2, !dbg !151

for.cond2:                                        ; preds = %for.inc6, %for.end
  %4 = load i64, i64* %i, align 8, !dbg !152
  %cmp3 = icmp ult i64 %4, 100, !dbg !154
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !155

for.body4:                                        ; preds = %for.cond2
  %5 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !158
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !159
  store i32 0, i32* %intOne, align 8, !dbg !160
  %6 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !162
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !163
  store i32 0, i32* %intTwo, align 4, !dbg !164
  br label %for.inc6, !dbg !165

for.inc6:                                         ; preds = %for.body4
  %7 = load i64, i64* %i, align 8, !dbg !166
  %inc7 = add i64 %7, 1, !dbg !166
  store i64 %inc7, i64* %i, align 8, !dbg !166
  br label %for.cond2, !dbg !167, !llvm.loop !168

for.end8:                                         ; preds = %for.cond2
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !170
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !171
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !171
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !171
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 800, i1 false), !dbg !171
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !172
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !172
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx9), !dbg !173
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !174
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !174
  call void @free(i8* %13) #6, !dbg !175
  ret void, !dbg !176
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17.c", directory: "/root/SSE-Assessment")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17.c", directory: "/root/SSE-Assessment")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "i", scope: !20, file: !21, line: 23, type: !10)
!25 = !DILocation(line: 23, column: 9, scope: !20)
!26 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 24, type: !4)
!27 = !DILocation(line: 24, column: 21, scope: !20)
!28 = !DILocation(line: 25, column: 10, scope: !20)
!29 = !DILocation(line: 26, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !21, line: 26, column: 5)
!31 = !DILocation(line: 26, column: 9, scope: !30)
!32 = !DILocation(line: 26, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !21, line: 26, column: 5)
!34 = !DILocation(line: 26, column: 18, scope: !33)
!35 = !DILocation(line: 26, column: 5, scope: !30)
!36 = !DILocation(line: 29, column: 33, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !21, line: 27, column: 5)
!38 = !DILocation(line: 29, column: 16, scope: !37)
!39 = !DILocation(line: 29, column: 14, scope: !37)
!40 = !DILocation(line: 30, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !21, line: 30, column: 13)
!42 = !DILocation(line: 30, column: 18, scope: !41)
!43 = !DILocation(line: 30, column: 13, scope: !37)
!44 = !DILocation(line: 30, column: 28, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !21, line: 30, column: 27)
!46 = !DILocation(line: 31, column: 5, scope: !37)
!47 = !DILocation(line: 26, column: 24, scope: !33)
!48 = !DILocation(line: 26, column: 5, scope: !33)
!49 = distinct !{!49, !35, !50, !51}
!50 = !DILocation(line: 31, column: 5, scope: !30)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "source", scope: !53, file: !21, line: 33, type: !54)
!53 = distinct !DILexicalBlock(scope: !20, file: !21, line: 32, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 33, column: 23, scope: !53)
!58 = !DILocalVariable(name: "i", scope: !59, file: !21, line: 35, type: !60)
!59 = distinct !DILexicalBlock(scope: !53, file: !21, line: 34, column: 9)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 46, baseType: !62)
!61 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!62 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 35, column: 20, scope: !59)
!64 = !DILocation(line: 37, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !21, line: 37, column: 13)
!66 = !DILocation(line: 37, column: 18, scope: !65)
!67 = !DILocation(line: 37, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !21, line: 37, column: 13)
!69 = !DILocation(line: 37, column: 27, scope: !68)
!70 = !DILocation(line: 37, column: 13, scope: !65)
!71 = !DILocation(line: 39, column: 24, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !21, line: 38, column: 13)
!73 = !DILocation(line: 39, column: 17, scope: !72)
!74 = !DILocation(line: 39, column: 27, scope: !72)
!75 = !DILocation(line: 39, column: 34, scope: !72)
!76 = !DILocation(line: 40, column: 24, scope: !72)
!77 = !DILocation(line: 40, column: 17, scope: !72)
!78 = !DILocation(line: 40, column: 27, scope: !72)
!79 = !DILocation(line: 40, column: 34, scope: !72)
!80 = !DILocation(line: 41, column: 13, scope: !72)
!81 = !DILocation(line: 37, column: 35, scope: !68)
!82 = !DILocation(line: 37, column: 13, scope: !68)
!83 = distinct !{!83, !70, !84, !51}
!84 = !DILocation(line: 41, column: 13, scope: !65)
!85 = !DILocation(line: 44, column: 16, scope: !53)
!86 = !DILocation(line: 44, column: 9, scope: !53)
!87 = !DILocation(line: 45, column: 26, scope: !53)
!88 = !DILocation(line: 45, column: 9, scope: !53)
!89 = !DILocation(line: 46, column: 14, scope: !53)
!90 = !DILocation(line: 46, column: 9, scope: !53)
!91 = !DILocation(line: 48, column: 1, scope: !20)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_17_good", scope: !21, file: !21, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 86, column: 5, scope: !92)
!94 = !DILocation(line: 87, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 99, type: !96, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!10, !10, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !21, line: 99, type: !10)
!102 = !DILocation(line: 99, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !21, line: 99, type: !98)
!104 = !DILocation(line: 99, column: 27, scope: !95)
!105 = !DILocation(line: 102, column: 22, scope: !95)
!106 = !DILocation(line: 102, column: 12, scope: !95)
!107 = !DILocation(line: 102, column: 5, scope: !95)
!108 = !DILocation(line: 104, column: 5, scope: !95)
!109 = !DILocation(line: 105, column: 5, scope: !95)
!110 = !DILocation(line: 106, column: 5, scope: !95)
!111 = !DILocation(line: 109, column: 5, scope: !95)
!112 = !DILocation(line: 110, column: 5, scope: !95)
!113 = !DILocation(line: 111, column: 5, scope: !95)
!114 = !DILocation(line: 113, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "h", scope: !115, file: !21, line: 57, type: !10)
!117 = !DILocation(line: 57, column: 9, scope: !115)
!118 = !DILocalVariable(name: "data", scope: !115, file: !21, line: 58, type: !4)
!119 = !DILocation(line: 58, column: 21, scope: !115)
!120 = !DILocation(line: 59, column: 10, scope: !115)
!121 = !DILocation(line: 60, column: 11, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !21, line: 60, column: 5)
!123 = !DILocation(line: 60, column: 9, scope: !122)
!124 = !DILocation(line: 60, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !21, line: 60, column: 5)
!126 = !DILocation(line: 60, column: 18, scope: !125)
!127 = !DILocation(line: 60, column: 5, scope: !122)
!128 = !DILocation(line: 63, column: 33, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !21, line: 61, column: 5)
!130 = !DILocation(line: 63, column: 16, scope: !129)
!131 = !DILocation(line: 63, column: 14, scope: !129)
!132 = !DILocation(line: 64, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !21, line: 64, column: 13)
!134 = !DILocation(line: 64, column: 18, scope: !133)
!135 = !DILocation(line: 64, column: 13, scope: !129)
!136 = !DILocation(line: 64, column: 28, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !21, line: 64, column: 27)
!138 = !DILocation(line: 65, column: 5, scope: !129)
!139 = !DILocation(line: 60, column: 24, scope: !125)
!140 = !DILocation(line: 60, column: 5, scope: !125)
!141 = distinct !{!141, !127, !142, !51}
!142 = !DILocation(line: 65, column: 5, scope: !122)
!143 = !DILocalVariable(name: "source", scope: !144, file: !21, line: 67, type: !54)
!144 = distinct !DILexicalBlock(scope: !115, file: !21, line: 66, column: 5)
!145 = !DILocation(line: 67, column: 23, scope: !144)
!146 = !DILocalVariable(name: "i", scope: !147, file: !21, line: 69, type: !60)
!147 = distinct !DILexicalBlock(scope: !144, file: !21, line: 68, column: 9)
!148 = !DILocation(line: 69, column: 20, scope: !147)
!149 = !DILocation(line: 71, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !21, line: 71, column: 13)
!151 = !DILocation(line: 71, column: 18, scope: !150)
!152 = !DILocation(line: 71, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !21, line: 71, column: 13)
!154 = !DILocation(line: 71, column: 27, scope: !153)
!155 = !DILocation(line: 71, column: 13, scope: !150)
!156 = !DILocation(line: 73, column: 24, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !21, line: 72, column: 13)
!158 = !DILocation(line: 73, column: 17, scope: !157)
!159 = !DILocation(line: 73, column: 27, scope: !157)
!160 = !DILocation(line: 73, column: 34, scope: !157)
!161 = !DILocation(line: 74, column: 24, scope: !157)
!162 = !DILocation(line: 74, column: 17, scope: !157)
!163 = !DILocation(line: 74, column: 27, scope: !157)
!164 = !DILocation(line: 74, column: 34, scope: !157)
!165 = !DILocation(line: 75, column: 13, scope: !157)
!166 = !DILocation(line: 71, column: 35, scope: !153)
!167 = !DILocation(line: 71, column: 13, scope: !153)
!168 = distinct !{!168, !155, !169, !51}
!169 = !DILocation(line: 75, column: 13, scope: !150)
!170 = !DILocation(line: 78, column: 16, scope: !144)
!171 = !DILocation(line: 78, column: 9, scope: !144)
!172 = !DILocation(line: 79, column: 26, scope: !144)
!173 = !DILocation(line: 79, column: 9, scope: !144)
!174 = !DILocation(line: 80, column: 14, scope: !144)
!175 = !DILocation(line: 80, column: 9, scope: !144)
!176 = !DILocation(line: 82, column: 1, scope: !115)
