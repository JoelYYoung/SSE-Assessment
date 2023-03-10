; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType = type { i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !34
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay1) #5, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %2), !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  call void @free(i8* %3) #5, !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !41 {
entry:
  %myStruct = alloca %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType* %myStruct, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i8** %data, metadata !44, metadata !DIExpression()), !dbg !45
  %structFirst = getelementptr inbounds %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType, %struct._CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !46
  %0 = load i8*, i8** %structFirst, align 8, !dbg !46
  store i8* %0, i8** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %1 = load i8*, i8** %data, align 8, !dbg !53
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !54
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay1) #5, !dbg !55
  %2 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %2), !dbg !57
  %3 = load i8*, i8** %data, align 8, !dbg !58
  call void @free(i8* %3) #5, !dbg !59
  ret void, !dbg !60
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b_badSink", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType", file: !10, line: 30, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67_structType", file: !10, line: 27, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 29, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 34, type: !13)
!20 = !DILocation(line: 34, column: 148, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 36, type: !17)
!22 = !DILocation(line: 36, column: 12, scope: !9)
!23 = !DILocation(line: 36, column: 28, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 38, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 37, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 38, column: 14, scope: !25)
!30 = !DILocation(line: 39, column: 9, scope: !25)
!31 = !DILocation(line: 40, column: 9, scope: !25)
!32 = !DILocation(line: 40, column: 23, scope: !25)
!33 = !DILocation(line: 42, column: 18, scope: !25)
!34 = !DILocation(line: 42, column: 35, scope: !25)
!35 = !DILocation(line: 42, column: 9, scope: !25)
!36 = !DILocation(line: 43, column: 19, scope: !25)
!37 = !DILocation(line: 43, column: 9, scope: !25)
!38 = !DILocation(line: 44, column: 14, scope: !25)
!39 = !DILocation(line: 44, column: 9, scope: !25)
!40 = !DILocation(line: 46, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_snprintf_67b_goodG2BSink", scope: !10, file: !10, line: 53, type: !11, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "myStruct", arg: 1, scope: !41, file: !10, line: 53, type: !13)
!43 = !DILocation(line: 53, column: 152, scope: !41)
!44 = !DILocalVariable(name: "data", scope: !41, file: !10, line: 55, type: !17)
!45 = !DILocation(line: 55, column: 12, scope: !41)
!46 = !DILocation(line: 55, column: 28, scope: !41)
!47 = !DILocalVariable(name: "source", scope: !48, file: !10, line: 57, type: !26)
!48 = distinct !DILexicalBlock(scope: !41, file: !10, line: 56, column: 5)
!49 = !DILocation(line: 57, column: 14, scope: !48)
!50 = !DILocation(line: 58, column: 9, scope: !48)
!51 = !DILocation(line: 59, column: 9, scope: !48)
!52 = !DILocation(line: 59, column: 23, scope: !48)
!53 = !DILocation(line: 61, column: 18, scope: !48)
!54 = !DILocation(line: 61, column: 35, scope: !48)
!55 = !DILocation(line: 61, column: 9, scope: !48)
!56 = !DILocation(line: 62, column: 19, scope: !48)
!57 = !DILocation(line: 62, column: 9, scope: !48)
!58 = !DILocation(line: 63, column: 14, scope: !48)
!59 = !DILocation(line: 63, column: 9, scope: !48)
!60 = !DILocation(line: 65, column: 1, scope: !41)
