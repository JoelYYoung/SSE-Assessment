; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b_badSink(i8** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i8*, i8** %0, align 8, !dbg !21
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !27
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %4 = load i8*, i8** %data, align 8, !dbg !30
  %call = call i64 @strlen(i8* %4) #7, !dbg !31
  %mul = mul i64 %call, 1, !dbg !32
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %3, i64 %mul, i1 false), !dbg !28
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  call void @printLine(i8* %5), !dbg !36
  %6 = load i8*, i8** %data, align 8, !dbg !37
  call void @free(i8* %6) #8, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b_goodG2BSink(i8** %dataPtr) #0 !dbg !40 {
entry:
  %dataPtr.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8** %dataPtr, i8*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataPtr.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i8**, i8*** %dataPtr.addr, align 8, !dbg !45
  %1 = load i8*, i8** %0, align 8, !dbg !46
  store i8* %1, i8** %data, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !49
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !49
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  %call = call i64 @strlen(i8* %4) #7, !dbg !53
  %mul = mul i64 %call, 1, !dbg !54
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %3, i64 %mul, i1 false), !dbg !50
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !55
  store i8 0, i8* %arrayidx, align 1, !dbg !56
  %5 = load i8*, i8** %data, align 8, !dbg !57
  call void @printLine(i8* %5), !dbg !58
  %6 = load i8*, i8** %data, align 8, !dbg !59
  call void @free(i8* %6) #8, !dbg !60
  ret void, !dbg !61
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 84, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 25, type: !14)
!19 = !DILocation(line: 25, column: 12, scope: !9)
!20 = !DILocation(line: 25, column: 20, scope: !9)
!21 = !DILocation(line: 25, column: 19, scope: !9)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !10, line: 27, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 26, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 27, column: 14, scope: !23)
!28 = !DILocation(line: 29, column: 9, scope: !23)
!29 = !DILocation(line: 29, column: 23, scope: !23)
!30 = !DILocation(line: 29, column: 36, scope: !23)
!31 = !DILocation(line: 29, column: 29, scope: !23)
!32 = !DILocation(line: 29, column: 41, scope: !23)
!33 = !DILocation(line: 30, column: 9, scope: !23)
!34 = !DILocation(line: 30, column: 20, scope: !23)
!35 = !DILocation(line: 31, column: 19, scope: !23)
!36 = !DILocation(line: 31, column: 9, scope: !23)
!37 = !DILocation(line: 32, column: 14, scope: !23)
!38 = !DILocation(line: 32, column: 9, scope: !23)
!39 = !DILocation(line: 34, column: 1, scope: !9)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_63b_goodG2BSink", scope: !10, file: !10, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !40, file: !10, line: 41, type: !13)
!42 = !DILocation(line: 41, column: 88, scope: !40)
!43 = !DILocalVariable(name: "data", scope: !40, file: !10, line: 43, type: !14)
!44 = !DILocation(line: 43, column: 12, scope: !40)
!45 = !DILocation(line: 43, column: 20, scope: !40)
!46 = !DILocation(line: 43, column: 19, scope: !40)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !10, line: 45, type: !24)
!48 = distinct !DILexicalBlock(scope: !40, file: !10, line: 44, column: 5)
!49 = !DILocation(line: 45, column: 14, scope: !48)
!50 = !DILocation(line: 47, column: 9, scope: !48)
!51 = !DILocation(line: 47, column: 23, scope: !48)
!52 = !DILocation(line: 47, column: 36, scope: !48)
!53 = !DILocation(line: 47, column: 29, scope: !48)
!54 = !DILocation(line: 47, column: 41, scope: !48)
!55 = !DILocation(line: 48, column: 9, scope: !48)
!56 = !DILocation(line: 48, column: 20, scope: !48)
!57 = !DILocation(line: 49, column: 19, scope: !48)
!58 = !DILocation(line: 49, column: 9, scope: !48)
!59 = !DILocation(line: 50, column: 14, scope: !48)
!60 = !DILocation(line: 50, column: 9, scope: !48)
!61 = !DILocation(line: 52, column: 1, scope: !40)
